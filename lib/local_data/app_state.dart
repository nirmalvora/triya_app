import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:triya_app/model/login_response.dart';

class AppState {
  static final AppState _singleton = AppState._internal();
  static LoginData? loginData;
  factory AppState() {
    return _singleton;
  }

  AppState._internal();

  EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();
}
