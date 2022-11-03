import 'package:flutter/material.dart';
import 'package:race/resources/resources.dart';
import 'dart:math' as math;

class CommonLoadingWidget extends StatefulWidget {
  const CommonLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CommonLoadingWidget> createState() => _CommonLoadingWidgetState();
}

class _CommonLoadingWidgetState extends State<CommonLoadingWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 1))
        ..repeat();

  @override
  dispose() {
  _controller.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 4 * math.pi,
          child: child,
        );
      },
      child: const Image(
        image: AssetImage(AppImages.loader),
      ),
    );
  }
}
