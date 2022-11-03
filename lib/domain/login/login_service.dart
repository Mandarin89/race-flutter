import 'package:race/domain/api_client/api_client.dart';
import 'package:race/entity/user_account/accounts.dart';

class LoginService extends ApiClient {
  Future<Map<String, dynamic>> getToken(
      {required String login, required String password, Account? account, String? mfa}) async {
    Map<String, dynamic> bodyParams = {"email": login, "password": password};
    if (account != null) {
      bodyParams.addAll({'account': account.toJson(account)});
    }
    if (mfa != null && mfa.isNotEmpty) {
      bodyParams.addAll({'mfa_code': mfa});
    }
    final request = await postRequest(
        "/users/mfa/authtoken/login/", bodyParams);
      final result = request as Map<String, dynamic>;
      // final result = Accounts.fromJson(json);
    return result;
  }
}
