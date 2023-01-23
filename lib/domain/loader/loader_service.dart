import 'dart:convert';

import 'package:race/domain/api_client/api_client.dart';

class LoaderService extends ApiClient {
  static const String userMyAccountUrl = '/accounts/api/v0/accounts/my/';

  Future<Map<String, dynamic>> getUserMe() async {
    final response = await getRequest(userMyAccountUrl,{"fields": 'id'});
    final request = await jsonDecode(utf8.decode(response.bodyBytes));
    final result = request as Map<String, dynamic>;
    return result;
  }
}
