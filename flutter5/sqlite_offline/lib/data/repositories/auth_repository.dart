import 'package:sqlite_offline/data/storage/local_storage.dart';

abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<String?> getUsername();
  Future<bool> login(String email, String password);
  Future<void> logout();
  Future<void> saveAuthState(bool isLoggedIn, String? username);
}

class MockAuthRepository implements AuthRepository {
  bool _isLoggedIn = false;
  String? _username;
  LocalStorage localStorage;

  MockAuthRepository({required this.localStorage});

  String isLoggedKey = 'isLoggedKey';
  String usernameKey = 'usernameKey';

  @override
  Future<bool> isLoggedIn() async {
    String? isLogged = await localStorage.getData<String>(key: isLoggedKey); 
    _isLoggedIn = isLogged == 'true';
    return _isLoggedIn;
  }

  @override
  Future<String?> getUsername() async {
    String? username = await localStorage.getData(key: usernameKey);
    _username = username;
    return _username;
  }

  @override
  Future<bool> login(String email, String password) async {
    // Simulação de login mockado
    if (email.isNotEmpty && password.isNotEmpty) {
      _isLoggedIn = true;
      _username = email.split('@').first;

      // TODO: Implementar salvamento do estado
      await saveAuthState(_isLoggedIn, _username);
      return true;
    }
    return false;
  }

  @override
  Future<void> logout() async {
    _isLoggedIn = false;
    _username = null;

    // TODO: Implementar limpeza do estado salvo
    await saveAuthState(_isLoggedIn, _username);
  }

  @override
  Future<void> saveAuthState(bool isLoggedIn, String? username) async {
    // TODO: Implementar persistência do estado
    await localStorage.create(key: isLoggedKey, data: isLoggedIn);
    await localStorage.create(key: usernameKey, data: username);
    _isLoggedIn = isLoggedIn;
    _username = username;
  }
}
