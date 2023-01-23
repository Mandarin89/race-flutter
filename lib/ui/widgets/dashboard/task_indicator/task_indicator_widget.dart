import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:race/resources/resources.dart';
import 'package:race/ui/common/linear_progress_indicator/linear_progress_indicator.dart';
import 'package:race/ui/theme/app_colors.dart';
import 'package:race/ui/theme/app_text_style.dart';

abstract class IndicatorType {
  static const open = 'openObj';
  static const ending = 'endingObj';
  static const delayed = 'delayedObj';
  static const pending = 'pending';
  static const submisson = 'submisson';
  static const emptyBox = 'emptyBox';

  static Map<String, dynamic> getObject(String type) {
    switch (type) {
      case IndicatorType.open:
        return IndicatorType.openObj;
      case IndicatorType.ending:
        return IndicatorType.endingObj;
      case IndicatorType.delayed:
        return IndicatorType.delayedObj;
      case IndicatorType.pending:
        return IndicatorType.pendingObj;
      case IndicatorType.submisson:
        return IndicatorType.submissionObj;
      case IndicatorType.emptyBox:
        return IndicatorType.emptyObj;
      default:
        return IndicatorType.openObj;
    }
  }

  static final openObj = {
    'text': 'Open Tasks',
    'img': SvgPicture.asset(AppImages.noteGreen,
        color: AppColors.mainGreenColor, fit: BoxFit.contain)
  };

  static final endingObj = {
    'text': 'Tasks ending',
    'img': SvgPicture.asset(AppImages.taskEnd,
        color: AppColors.yellowColor, fit: BoxFit.contain)
  };

  static final delayedObj = {
    'text': 'Tasks Delayed',
    'img': SvgPicture.asset(AppImages.warning,
        color: AppColors.crimsonColor, fit: BoxFit.contain)
  };

  static final pendingObj = {
    'text': 'Pending Specs',
    'img': SvgPicture.asset(AppImages.pendingApproval,
        color: AppColors.mainBlueColor, fit: BoxFit.contain)
  };

  static final submissionObj = {
    'text': 'New Submissons',
    'img': SvgPicture.asset(AppImages.submission,
        color: AppColors.mainBlueColor, fit: BoxFit.contain)
  };

  static final emptyObj = {
    'text': '',
    'img': SvgPicture.asset(AppImages.submission,
        color: Colors.transparent, fit: BoxFit.contain)
  };
}

class TaskIndicatorWidget extends StatelessWidget {
  final String type;
  final int taskCount;
  final bool isActive;
  final bool loading;
  const TaskIndicatorWidget(
      {Key? key,
      required this.type,
      required this.taskCount,
      required this.isActive,
      required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indicator = IndicatorType.getObject(type);
    final text = indicator['text'];
    final SvgPicture img = indicator['img'];
    final isEmpty = type == IndicatorType.emptyBox;
    final Widget loadingWidget = (() {
      if (!isEmpty && loading) {
        return Positioned.fill(
            child: Align(
          alignment: Alignment.center,
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.35 > 120
                  ? MediaQuery.of(context).size.width * 0.30
                  : 135,
              height: 5,
              child: const LoadingIndicator()),
        ));
      } else {
        return const SizedBox.shrink();
      }
    }());
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.30 > 135
                  ? MediaQuery.of(context).size.width * 0.30
                  : 135,
              minWidth: 135),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: !isEmpty
                  ? Border.all(
                      color: isActive
                          ? AppColors.mainBlueColor
                          : AppColors.borderGrayColor)
                  : null,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.065,
                      height: MediaQuery.of(context).size.width * 0.065,
                      child: img,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                        width: 35,
                        child: Text(
                          '${!isEmpty ? taskCount : ''}',
                          style: AppTextStyles.mediumHeader,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: SizedBox(
                    width: 135,
                    child: Center(
                      child: Text(
                        text,
                        style: AppTextStyles.smallHeader,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        loadingWidget
      ],
    );
  }
}
