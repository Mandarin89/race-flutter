import 'package:flutter/material.dart';
import 'package:race/domain/api_client/api_client.dart';
import 'package:race/domain/data_providers/session_data_provider.dart';
import 'package:race/domain/loader/loader_service.dart';
import 'package:race/ui/navigator/main_navigator.dart';

class LoaderWidgetModel extends ChangeNotifier {
  final _loaderService = LoaderService();
  final _sessionDataProvider = SessionDataProvider();

  Future<String?> _isToken() async {
    String? token = await _sessionDataProvider.getToken();
    return token;
  }

  Future<void> getUserMe(BuildContext context) async {
    final token = await _isToken();
    
    if (token == null) {
      _redirected(context, false);
    }

    try {
      final res = await _loaderService.getUserMe();
      
      _redirected(context, true);
    } on ApiClientException catch (_) {
      _redirected(context, false);
    }
  }

  Future<void> _redirected(BuildContext context, bool isAuth) async {
    Future.delayed(const Duration(milliseconds: 3000), (() {
      final rout = isAuth
          ? MainNavigatorRouteNames.dashboard
          : MainNavigatorRouteNames.login;
      Navigator.of(context).pushNamed(rout);
    }));
  }
}
