import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:race/domain/data_providers/provider.dart';
import 'package:race/entity/dashboard/task.dart';
import 'package:race/resources/resources.dart';
import 'package:race/ui/common/loading/loading_widget.dart';
import 'package:race/ui/theme/app_colors.dart';
import 'package:race/ui/theme/app_text_style.dart';
import 'package:race/ui/widgets/dashboard/tasks_card/task_list/task_list_model.dart';
import 'package:race/ui/widgets/dashboard/tasks_card/tasks_card_model.dart';

class TaskListWidget extends StatelessWidget {
  final String indicatorType;
  final ActiveObject activeCard;
  List<Task> taskList = [];
  TaskListWidget(
      {Key? key, required this.indicatorType, required this.taskList, required this.activeCard})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TaskListWidgetModel>(context);
    ScrollController controller = ScrollController();

    final Widget loadingWidget = (() {
      if (model!.loading) {
        return const Positioned.fill(
            top: 20,
            child: Align(
              alignment: Alignment.center,
              child: CommonLoadingWidget(),
            ));
      } else {
        return const SizedBox.shrink();
      }
    }());

    controller.addListener(() async {
      if (controller.position.pixels == controller.position.maxScrollExtent && activeCard.totalCount! > taskList.length) {
        await model!.update(totalCount: activeCard.totalCount ?? 0, totalLength: taskList.length, type: indicatorType);
        taskList.addAll(model.taskList);
      }
    });
    // List<Widget> taskItems() {
    //   List<Widget> taskListWidgets = [];
    //   if (taskList.isNotEmpty) {
    //     for (int i = 0; i < taskList.length; i++) {
    //       taskListWidgets.add(_TaskItemWidget(model: taskList[i]));
    //     }
    //   }
    // }
    // return SizedBox();
    return Stack(
      alignment: Alignment.center,
      children: [
        ListView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            return taskList.isNotEmpty
                ? _TaskItemWidget(model: taskList[index])
                : loadingWidget;
          },
          itemCount: taskList.length,
          // children: [...taskItems()],
        ),
        loadingWidget
      ],
    );
  }
}

class _TaskItemWidget extends StatelessWidget {
  final Task model;
  const _TaskItemWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.065,
              height: MediaQuery.of(context).size.width * 0.065,
              child: Image.asset(
                AppImages.taskStatus,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.65,
                  ),
                  child: Text(
                    maxLines: 1,
                    softWrap: false,
                    model.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.smallBoldHeader,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.65,
                  ),
                  child: Text(
                    maxLines: 1,
                    softWrap: false,
                    model.phase!.project!.name!,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.smallGrayHeader,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.65,
                  ),
                  child: Text(
                    maxLines: 1,
                    softWrap: false,
                    'Planned Start Date: ${model.startDate != null ? DateFormat.yMEd().format(model.startDate!) : null}',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.smallGrayHeader,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.65,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: const BoxDecoration(
                            color: AppColors.mainGreyColor,
                            shape: BoxShape.circle),
                      ),
                      Text(
                        maxLines: 1,
                        softWrap: false,
                        model.statusDisplay!,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.smallGrayHeader,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          width: 10,
          height: 25,
        )
      ],
    );
  }
}
