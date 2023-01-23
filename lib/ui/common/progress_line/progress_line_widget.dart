import 'package:flutter/material.dart';
import 'package:race/ui/theme/app_colors.dart';

class Constrains {
  double maxWidth;
  double? maxHeight;
  double? minWidth;
  double? minHeight;

  Constrains({required this.maxWidth});
}

class LineParams {
  Color color;
  double fillPercent;

  LineParams({required this.color, required this.fillPercent});
}

class ProgressAnimatedWidget extends StatefulWidget {
  // final Constrains containerConstrains;
  final double fillPercent;

  const ProgressAnimatedWidget({Key? key, 
  // required this.containerConstrains, 
  required this.fillPercent})
      : super(key: key);

  @override
  State<ProgressAnimatedWidget> createState() => _ProgressAnimatedWidgetState();
}

class _ProgressAnimatedWidgetState extends State<ProgressAnimatedWidget>
    with SingleTickerProviderStateMixin {
  double progress = 0.0;
  late Animation<double> animation;
  late final controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    double calcEndPoint() {
    double result = widget.fillPercent / 100;
    return result;
  }

  @override
  void initState() {
    super.initState();
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          if (calcEndPoint() >= animation.value) {
          progress = animation.value;
          }
        });
      });

    controller.forward();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final containerConstrains = widget.containerConstrains;
    final fillPersents = widget.fillPercent;
    return Center(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            constraints: const BoxConstraints(
                /*maxWidth: containerConstrains.maxWidth,*/ maxHeight: 8),
            // width: containerConstrains.maxWidth,
            width: double.infinity,
            child: CustomPaint(
              painter: LinePainter(
                  params: LineParams(
                      color: AppColors.mainGreyColor, fillPercent: 100),
                  progress: progress,
                  animate: false),
            ),
          ),
          Container(
              color: Colors.white,
              constraints: const BoxConstraints(
                  /*maxWidth: containerConstrains.maxWidth,*/ maxHeight: 8),
              // width: containerConstrains.maxWidth,
              width: double.infinity,
              child: CustomPaint(
                painter: LinePainter(
                    params: LineParams(
                        color: AppColors.mainBlueColor, fillPercent: fillPersents),
                    progress: progress,
                    animate: true),
              )),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  LineParams params;
  double progress;
  bool animate;

  LinePainter(
      {required this.params, required this.progress, required this.animate});

  double calcEndPoint() {
    double result = params.fillPercent / 100;
    return result;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = params.color
      ..strokeWidth = 7;
    Offset endPoint = Offset(size.width * progress, 0);
    if (!animate) {
      endPoint = Offset(size.width, 0);
    }
    canvas.drawLine(const Offset(0.0, 0.0), endPoint, paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    if (!animate) {
      return false;
    }
    final double endPointCoeff = calcEndPoint();
    return oldDelegate.progress != progress && progress <= endPointCoeff;
  }
}
