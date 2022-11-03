import 'package:flutter/material.dart';
import 'package:race/domain/api_client/api_client.dart';
import 'package:race/domain/data_providers/session_data_provider.dart';
import 'package:race/domain/login/login_service.dart';
import 'package:race/entity/user_account/accounts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:race/ui/navigator/main_navigator.dart';

class LoginWidgetModel extends ChangeNotifier {
  final _loginService = LoginService();
  final _sessionDataProvider = SessionDataProvider();
  bool _loading = false;
  get loading => _loading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  List<Account>? accounts;
  bool _showAccountsFrame = false;
  bool get showAccountsFrame => _showAccountsFrame;
  bool _showMfaFrame = false;
  bool get showMfaFrame => _showMfaFrame;
  Account? _selectedAccount;
  Account? get selectedAccount => _selectedAccount;
  String? _token;
  String? get xcrfToken => _token;

  final loginTextController = TextEditingController(text: 'neopg@mail.ru');
  final passwordTextController = TextEditingController(text: '123123');
  final mfaTextController = TextEditingController();

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    final mfa = mfaTextController.text;

    _loading = true;
    notifyListeners();
    try {
      _errorMessage = '';
      final result = await _loginService.getToken(
          login: login,
          password: password,
          account: _selectedAccount,
          mfa: mfa);
      if (result.containsKey('accounts')) {
        final json = Accounts.fromJson(result);
        accounts = json.accounts;
        final url = dotenv.env['API_URL'];
        String? fileUrl;
        for (var account in accounts!) {
          fileUrl = account.companyLogo?.file;
          account.companyLogo?.file =
              url != null && fileUrl != null ? url + fileUrl : fileUrl;
        }
        changeAccountsFrame();
      } else if (result.containsKey('mfa_required')) {
        changeMfaFrame();
      } else if (result.containsKey('token')) {
        saveToken(result['token'] as String);
        Navigator.of(context)
          .pushNamedAndRemoveUntil(MainNavigatorRouteNames.dashboard, (route) => false);
      }
    } on ApiClientException catch (_) {
      _errorMessage = 'Incorrect Email or Password';
    }
    _loading = false;
    notifyListeners();
  }

  void changeAccountsFrame() {
    _showAccountsFrame = !_showAccountsFrame;
    notifyListeners();
  }

  void changeMfaFrame() {
    _showMfaFrame = !_showMfaFrame;
    _showAccountsFrame = !_showAccountsFrame;
    notifyListeners();
  }

  void changeAuthFrame() {
    _showMfaFrame = false;
    _showAccountsFrame = false;
    _selectedAccount = null;
    notifyListeners();
  }

  void selectAccount(Account account) {
    _selectedAccount = account;
    notifyListeners();
  }

  void saveToken(String token) async {
    _token = token;
    return await _sessionDataProvider.setToken(_token);
    // notifyListeners();
  }
}
