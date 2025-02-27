import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;

  const Responsive({Key? key, required this.mobile, required this.tablet}) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200 &&
      MediaQuery.of(context).size.width >= 768;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If width it less then 1200 and more then 768 we consider it as tablet
    if (size.width >= 768) {
      return tablet;
    }
    // Or less then that we called it mobile
    else if (size.width >= 376 && size.width <= 768) {
      return mobile;
    } else {
      return mobile;
    }
  }
}