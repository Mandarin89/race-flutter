import 'package:race/domain/api_client/api_client.dart';
import 'package:race/domain/data_providers/session_data_provider.dart';
import 'package:race/entity/user_account/accounts.dart';

class LoginService extends ApiClient {
  final _sessionDataProvider = SessionDataProvider();

  Future<Map<String, dynamic>> getToken(
      {required String login,
      required String password,
      Account? account,
      String? mfa}) async {
    Map<String, dynamic> bodyParams = {"email": login, "password": password};
    if (account != null) {
      bodyParams.addAll({'account': account.toJson()});
    }
    if (mfa != null && mfa.isNotEmpty) {
      bodyParams.addAll({'mfa_code': mfa});
    }
    final request =
        await makeRequest('post',"/users/mfa/authtoken/login/", bodyParams);
    final result = request as Map<String, dynamic>;
    return result;
  }

  Future<void> _removeToken() async {
    await _sessionDataProvider.removeToken();
  }

  Future<bool> logOut() async {
    await _removeToken();
    return true;
  }
}
