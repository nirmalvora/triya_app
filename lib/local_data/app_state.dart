import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:get/get.dart';
import 'package:triya_app/model/login_response.dart';

class AppState {
  static final AppState _singleton = AppState._internal();
  static Rx<LoginData?> loginData = Rx<LoginData?>(null);
  factory AppState() {
    return _singleton;
  }

  AppState._internal();

  EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();
}
