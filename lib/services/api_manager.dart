class AuthApiManager {
  static final AuthApiManager instance = AuthApiManager._internal();
  factory AuthApiManager() {
    return instance;
  }
  AuthApiManager._internal();

}
