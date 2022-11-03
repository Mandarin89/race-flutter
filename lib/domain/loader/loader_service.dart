import 'package:race/domain/api_client/api_client.dart';

class LoaderService extends ApiClient {
  static const String userMyAccountUrl = '/accounts/api/v0/accounts/my/';

  Future<Map<String, dynamic>> getUserMe() async {
    final request = await getRequest(userMyAccountUrl,{"fields": 'id'});
    final result = request as Map<String, dynamic>;
    return result;
  }
}
