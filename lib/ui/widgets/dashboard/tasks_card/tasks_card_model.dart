import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:race/domain/dashboard/task_card/task_card_service.dart';
import 'package:race/domain/data_providers/session_data_provider.dart';
import 'package:race/entity/dashboard/task.dart';
import 'package:race/ui/widgets/dashboard/task_indicator/task_indicator_widget.dart';

class ActiveObject {
  bool isActive;
  String text;
  bool loading;
  int? totalCount;

  ActiveObject(
      {required this.isActive, required this.text, required this.loading});
}

class TaskCardWidgetModel extends ChangeNotifier {
  Map<String, ActiveObject> tasksIndicatorList = {
    IndicatorType.open:
        ActiveObject(isActive: true, text: 'Open Tasks', loading: true),
    IndicatorType.pending: ActiveObject(
        isActive: false, text: 'Pending Specifications', loading: true),
    IndicatorType.ending:
        ActiveObject(isActive: false, text: 'Task Ending', loading: true),
    IndicatorType.delayed:
        ActiveObject(isActive: false, text: 'Task Delayed', loading: true),
    IndicatorType.emptyBox:
        ActiveObject(isActive: false, text: '', loading: false),
    IndicatorType.submisson:
        ActiveObject(isActive: false, text: 'New Submissions', loading: true),
  };

  final taskCardService = TaskCardService();
  late ActiveObject _activeCard;
  ActiveObject get activeCard => _activeCard;
  bool loadingTaskList = false;
  List<Task> _taskList = [];
  List<Task> get taskList => _taskList;
  String _indicatorType = IndicatorType.open;
  String get indicatorType => _indicatorType;

  int _openTasksCount = 0;
  int get openTasksCount => _openTasksCount;
  int _openSupplierCount = 0;
  int get openSupplierCount => _openSupplierCount;
  int _openTaskAndSupplierCount = 0;
  int get openTaskAndSupplierCount => _openTaskAndSupplierCount;
  int _tasksEndingCount = 0;
  int get tasksEndingCount => _tasksEndingCount;
  int _tasksPendingSpecsCount = 0;
  int get tasksPendingSpecsCount => _tasksPendingSpecsCount;
  int _tasksDelayedCount = 0;
  int get tasksDelayedCount => _tasksDelayedCount;
  int _tasksSubmissionsCount = 0;
  int get tasksSubmissionsCount => _tasksSubmissionsCount;

  TaskCardWidgetModel() {
    _activeCard = tasksIndicatorList[IndicatorType.open]!;
    getCounts();
  }

  Future<void> getCounts() async {
    final Map<String, dynamic> paramsOpen = {
      'limit': '0',
      'offset': '0',
      'status': ['IPg', 'NSt'],
      'phase__project__status': ['IPg', 'NSt'],
      'relevant': 'True',
      'fields': 'id'
    };
    _openTasksCount = await getOpenTaskCount(paramsOpen);
    final String? managerId = await SessionDataProvider().getManagerId();

    final Map<String, dynamic> paramsOpenSupplier = {
      'limit': '0',
      'offset': '0',
      'status': ['Sld'],
      'phase__project__status': ['Cpd'],
      'is_rated': 'False',
      'fields': 'id',
      'project__manager': managerId
    };
    _openSupplierCount = await getOpenSupplierCount(paramsOpenSupplier);
    _openTaskAndSupplierCount = _openTasksCount + _openSupplierCount;
    tasksIndicatorList[IndicatorType.open]!.loading = false;
    tasksIndicatorList[IndicatorType.open]!.totalCount = _openTasksCount;
    // notifyListeners();

    final now = DateTime.now();
    final fromDate =
        DateFormat('y-MM-DD').format(DateTime(now.year, now.month, now.day));
    final toDate = DateFormat('y-MM-DD')
        .format(DateTime(now.year, now.month, now.day + 7));

    final Map<String, dynamic> paramsEnding = {
      'limit': '0',
      'offset': '0',
      'status': ['IPg', 'NSt'],
      'phase__project__status': ['IPg', 'NSt'],
      'relevant': 'True',
      'fields': 'id',
      'is_ending__range': '$fromDate,$toDate'
    };
    _tasksEndingCount = await getEndingTaskCount(paramsEnding);
    tasksIndicatorList[IndicatorType.ending]!.loading = false;
    tasksIndicatorList[IndicatorType.ending]!.totalCount = _tasksEndingCount;
    // notifyListeners();

    final Map<String, dynamic> paramsDelayed = {
      'limit': '0',
      'offset': '0',
      'status': ['IPg', 'NSt'],
      'phase__project__status': ['IPg', 'NSt'],
      'relevant': 'True',
      'fields': 'id',
      'is_delayed': 'True'
    };
    _tasksDelayedCount = await getDelayedTaskCount(paramsDelayed);
    tasksIndicatorList[IndicatorType.delayed]!.loading = false;
    tasksIndicatorList[IndicatorType.delayed]!.totalCount = _tasksDelayedCount;
    // notifyListeners();

    final Map<String, dynamic> paramsPendingSpecs = {
      'limit': '0',
      'offset': '0',
      'status': ['Rq', 'Sb'],
    };
    _tasksPendingSpecsCount = await getPendingSpecsCount(paramsPendingSpecs);
    tasksIndicatorList[IndicatorType.pending]!.loading = false;
    tasksIndicatorList[IndicatorType.pending]!.totalCount = _tasksPendingSpecsCount;
    // notifyListeners();

    final createdDate = DateFormat('y-MM-DD')
        .format(DateTime(now.year, now.month, now.day - 7));
    final Map<String, dynamic> paramsNewSubmissions = {
      'limit': '0',
      'offset': '0',
      'itemCount': '0',
      'relevant': 'True',
      'fields': 'id',
      'created__date__gt': createdDate
    };
    _tasksSubmissionsCount = await getNewSubmissionsCount(paramsNewSubmissions);
    tasksIndicatorList[IndicatorType.submisson]!.loading = false;
    tasksIndicatorList[IndicatorType.submisson]!.totalCount = _tasksSubmissionsCount;
    notifyListeners();
  }

  Future<int> getOpenTaskCount(Map<String, dynamic> params) async {
    int result = 0;
    await taskCardService.getOpenTask(params);
    result = taskCardService.tasksCount;
    if (result > 0) {
      getOpenTask();
    }

    return result;
  }

  Future<int> getEndingTaskCount(Map<String, dynamic> params) async {
    int result = 0;
    await taskCardService.getOpenTask(params);
    result = taskCardService.tasksCount;
    return result;
  }

  Future<int> getDelayedTaskCount(Map<String, dynamic> params) async {
    int result = 0;
    await taskCardService.getOpenTask(params);
    result = taskCardService.tasksCount;
    return result;
  }

  Future<int> getOpenSupplierCount(Map<String, dynamic> params) async {
    int result = 0;
    await taskCardService.getOpenSupplierTask(params);
    result = taskCardService.tasksCount;

    return result;
  }

  Future<int> getPendingSpecsCount(Map<String, dynamic> params) async {
    int result = 0;
    await taskCardService.getPendingSpecs(params);
    result = taskCardService.tasksCount;

    return result;
  }

  Future<int> getNewSubmissionsCount(Map<String, dynamic> params) async {
    int result = 0;
    await taskCardService.getNewSubmissions(params);
    result = taskCardService.tasksCount;

    return result;
  }

  Future<void> getOpenTask() async {

    final Map<String, dynamic> paramsOpen = {
      'limit': '3',
      'offset': '0',
      'status': ['IPg', 'NSt'],
      'phase__project__status': ['IPg', 'NSt'],
      'relevant': 'True',
      'fields':
          'id,status,status_display,name,approval_required,assignment_required,phase.project.id,phase.project.name,start_date,end_date,actual_start_date,assigned_to.profile.id',
      'ordering': 'start_date,id'
    };

    loadingTaskList = true;
    notifyListeners();
    _taskList = await taskCardService.getOpenTask(paramsOpen);
    loadingTaskList = false;
    notifyListeners();
  }

  void changeTaskIndicatorActive(String type) {
    if (tasksIndicatorList.containsKey(type) && tasksIndicatorList[type]!.text != activeCard.text) {
      _indicatorType = type;
      tasksIndicatorList.forEach((key, ActiveObject value) {
        value.isActive = false;
        if (key == type) {
          value.isActive = true;
          _activeCard = value;
          notifyListeners();
        }
      });
    }
  }
}
