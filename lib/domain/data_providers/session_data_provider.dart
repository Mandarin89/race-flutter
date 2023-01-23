import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const token = 'X-CSRFToken';
  static const managerId = 'managerId';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getToken() => _secureStorage.read(key: _Keys.token);
  Future<void> setToken(String? value) {
    if (value != null) {
      return _secureStorage.write(key: _Keys.token, value: value);
    } else {
      return _secureStorage.delete(key: _Keys.token);
    }
  }

  Future<String?> getManagerId() => _secureStorage.read(key: _Keys.managerId);
    Future<void> setManagerid(String? value) {
    if (value != null) {
      return _secureStorage.write(key: _Keys.managerId, value: value);
    } else {
      return _secureStorage.delete(key: _Keys.managerId);
    }
  }

  Future<void> removeToken() => _secureStorage.deleteAll();
  
}
