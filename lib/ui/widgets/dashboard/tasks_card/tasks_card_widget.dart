import 'package:flutter/material.dart';
import 'package:race/domain/data_providers/provider.dart';
import 'package:race/entity/dashboard/task.dart';
import 'package:race/ui/theme/app_colors.dart';
import 'package:race/ui/theme/app_text_style.dart';
import 'package:race/ui/widgets/dashboard/task_indicator/task_indicator_widget.dart';
import 'package:race/ui/widgets/dashboard/tasks_card/task_list/task_list_model.dart';
import 'package:race/ui/widgets/dashboard/tasks_card/task_list/task_list_widget.dart';
import 'package:race/ui/widgets/dashboard/tasks_card/tasks_card_model.dart';

class CountState extends InheritedWidget {

  final ActiveObject activeCard;
  final Widget child;

  const CountState({Key? key, required this.activeCard, required this.child})
      : super(key: key, child: child);

  static CountState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CountState>());
  }

  @override
  bool updateShouldNotify(CountState oldWidget) {
    //return true;
    return activeCard != oldWidget.activeCard;
  }
}


class TasksCard extends StatelessWidget {
    const TasksCard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      margin: const EdgeInsets.all(10),
      child: NotifierProvider(
          model: TaskCardWidgetModel(), child: const _CardCount()),
    );
  }
}

class _CardCount extends StatelessWidget {
  const _CardCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TaskCardWidgetModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  onTap: () {
                    model!.openTaskAndSupplierCount != 0
                        ? model.changeTaskIndicatorActive(IndicatorType.open)
                        : null;
                  },
                  child: TaskIndicatorWidget(
                    type: IndicatorType.open,
                    taskCount: model!.openTaskAndSupplierCount,
                    isActive: model
                        .tasksIndicatorList[IndicatorType.open]!.isActive,
                    loading:
                        model.tasksIndicatorList[IndicatorType.open]!.loading,
                  ),
                ),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  onTap: () {
                    model.tasksEndingCount != 0
                        ? model
                            .changeTaskIndicatorActive(IndicatorType.ending)
                        : 0;
                  },
                  child: TaskIndicatorWidget(
                    type: IndicatorType.ending,
                    taskCount: model.tasksEndingCount,
                    isActive: model
                        .tasksIndicatorList[IndicatorType.ending]!.isActive,
                    loading: model
                        .tasksIndicatorList[IndicatorType.ending]!.loading,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  onTap: () {
                    model.tasksDelayedCount != 0
                        ? model
                            .changeTaskIndicatorActive(IndicatorType.delayed)
                        : null;
                  },
                  child: TaskIndicatorWidget(
                    type: IndicatorType.delayed,
                    taskCount: model.tasksDelayedCount,
                    isActive: model
                        .tasksIndicatorList[IndicatorType.delayed]!.isActive,
                    loading: model
                        .tasksIndicatorList[IndicatorType.delayed]!.loading,
                  ),
                ),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  onTap: () {
                    model.tasksPendingSpecsCount != 0
                        ? model
                            .changeTaskIndicatorActive(IndicatorType.pending)
                        : 0;
                  },
                  child: TaskIndicatorWidget(
                    type: IndicatorType.pending,
                    taskCount: model.tasksPendingSpecsCount,
                    isActive: model
                        .tasksIndicatorList[IndicatorType.pending]!.isActive,
                    loading: model
                        .tasksIndicatorList[IndicatorType.pending]!.loading,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TaskIndicatorWidget(
                  type: IndicatorType.emptyBox,
                  taskCount: 0,
                  isActive: model
                      .tasksIndicatorList[IndicatorType.emptyBox]!.isActive,
                  loading: model
                      .tasksIndicatorList[IndicatorType.emptyBox]!.loading,
                ),
                InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  onTap: () {
                    model.tasksSubmissionsCount != 0
                        ? model.changeTaskIndicatorActive(
                            IndicatorType.submisson)
                        : null;
                  },
                  child: TaskIndicatorWidget(
                    type: IndicatorType.submisson,
                    taskCount: model.tasksSubmissionsCount,
                    isActive: model
                        .tasksIndicatorList[IndicatorType.submisson]!
                        .isActive,
                    loading: model
                        .tasksIndicatorList[IndicatorType.submisson]!.loading,
                  ),
                ),
              ],
            ),
          ),
          _TaskListWidget(indicatorType: model.indicatorType, activeCard: model.activeCard, taskList: model.taskList,),
        ],
      ),
    );
  }
}

class _TaskListWidget extends StatelessWidget {
  final ActiveObject activeCard;
  final String indicatorType;
  final List<Task> taskList;
  const _TaskListWidget({
    Key? key,
    required this.activeCard,
    required this.indicatorType,
    required this.taskList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            children: [
              Text(
                activeCard.text,
                style: AppTextStyles.mediumHeader,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderGrayColor),
                    borderRadius: BorderRadius.circular(7)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: NotifierProvider(model: TaskListWidgetModel(), child: TaskListWidget(indicatorType: indicatorType, taskList: taskList, activeCard: activeCard,)),
                ),
              ),
            )),
      ],
    );
  }
}
