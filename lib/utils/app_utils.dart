import 'dart:convert';

import 'package:get/get.dart';
import 'package:triya_app/local_data/app_state.dart';
import 'package:triya_app/model/login_response.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/preference/preference_keys.dart';
import 'package:triya_app/preference/prerences.dart';

class AppUtils {
  static getSVGAsset(String asset) {
    return "assets/svgs/$asset.svg";
  }

  static getPNGAsset(String asset) {
    return "assets/images/$asset.png";
  }

  static void LoginEmployeeSuccess(data) {
    LoginResponse response = LoginResponse.fromJson(data);
    Get.snackbar(response.message!, "");
    AppState.loginData.value = response.data;
    Preferences.setBool(PreferenceKeys.isLogin, true);
    Preferences.setString(
        PreferenceKeys.userProfile, jsonEncode(response.toJson()));
    Preferences.setInt(PreferenceKeys.userRole, response.data!.user!.roleId!);
    Preferences.setString(PreferenceKeys.accessToken, response.data!.token);
    if (response.data?.user?.roleId == 2) {
      Get.offAllNamed(NavigationName.dashboard);
    } else {
      Get.offAllNamed(NavigationName.employerDashboard);
    }
  }
}
