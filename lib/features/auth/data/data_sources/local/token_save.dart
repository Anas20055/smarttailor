import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyLocalRepo {
  final _sessionDataProvider = SessionDataProvider();
  var _isAuth = false;
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    _isAuth = sessionId != null;
  }
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getSessionId() => _secureStorage.read(key: 'token');
  Future<void> setSessionId(String? value) {
    if (value != null) {
      return _secureStorage.write(key: 'token', value: value);
    } else {
      return _secureStorage.delete(key: 'token');
    }
  }
}
