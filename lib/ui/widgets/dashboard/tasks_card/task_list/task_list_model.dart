import 'package:flutter/material.dart';
import 'package:race/domain/dashboard/task_card/task_card_service.dart';
import 'package:race/entity/dashboard/task.dart';
import 'package:race/ui/widgets/dashboard/task_indicator/task_indicator_widget.dart';

class TaskListWidgetModel extends ChangeNotifier {
  final _taskCardService = TaskCardService();
  bool _loading = false;
  bool get loading => _loading;
  List<Task> _taskList = [];
  List<Task> get taskList => _taskList;

  Future<void> update({required int totalCount, required int totalLength, required String type}) async {
    _loading = !_loading;
    notifyListeners();

    _taskList = [];
    int limit = 3;
    int currentPage = (totalLength / limit).floor() - 1;
    int totalPages = (totalCount / limit).ceil() - 1;
    int offset = (currentPage + 1) * limit;
    if (totalPages > currentPage) {
      switch (type) {
        case IndicatorType.open:
          List<Task> list = await getOpenTask(limit, offset);
          _taskList.addAll(list);
          _loading = !_loading;
          notifyListeners();
          break;
        default:
      }
    }
  }

  Future<List<Task>> getOpenTask(int limit, int offset) async {
    final Map<String, dynamic> paramsOpen = {
      'limit': '$limit',
      'offset': '$offset',
      'status': ['IPg', 'NSt'],
      'phase__project__status': ['IPg', 'NSt'],
      'relevant': 'True',
      'fields':
          'id,status,status_display,name,approval_required,assignment_required,phase.project.id,phase.project.name,start_date,end_date,actual_start_date,assigned_to.profile.id',
      'ordering': 'start_date,id'
    };

    return await _taskCardService.getOpenTask(paramsOpen);
  }
}
