import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

class AppState {
  static final AppState _singleton = AppState._internal();

  factory AppState() {
    return _singleton;
  }

  AppState._internal();

  EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();
}
