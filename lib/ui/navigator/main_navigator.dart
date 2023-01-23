import 'package:flutter/material.dart';
import 'package:race/ui/widgets/dashboard/dashboard_widget.dart';
import 'package:race/ui/widgets/loader/loader_widget.dart';
import 'package:race/ui/widgets/login/login_widget.dart';
import 'package:race/ui/widgets/profile_detail/profile_detail_widget.dart';

abstract class MainNavigatorRouteNames {
  static const loader = '/loader';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const profileDetail = '/profile';
}

class MainNavigator {
    String initialRoute() => MainNavigatorRouteNames.loader;

  final routes = <String, Widget Function(BuildContext)> {
    MainNavigatorRouteNames.login: (context) => const LoginWidget(),
    MainNavigatorRouteNames.dashboard: (context) => const Dashboard(),
    MainNavigatorRouteNames.loader: (context) => const LoaderWidget(),
    MainNavigatorRouteNames.profileDetail: (context) => const ProfileDetailWidget(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        const widget = Text('404');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }

}