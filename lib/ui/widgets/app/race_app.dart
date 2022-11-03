import 'package:flutter/material.dart';
import 'package:race/ui/navigator/main_navigator.dart';
import 'package:race/ui/theme/app_colors.dart';

class RaceApp extends StatelessWidget {
  static final mainNavigation = MainNavigator();
  const RaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Race',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.mainWhiteColor,
      )),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(),
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
