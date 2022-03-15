import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/login_response.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/preference/preference_keys.dart';
import 'package:triya_app/preference/prerences.dart';

import '../../../services/api_service_methods.dart';

class LoginScreenController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signIn() {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        'email': email.text,
        'password': password.text,
      };
      BaseApiService.instance
          .post(ServiceConstant.signIn, data: data)
          .then((value) {
        LoginResponse response = LoginResponse.fromJson(value!.data);
        Get.snackbar(response.message!, "");
        Preferences.setBool(PreferenceKeys.isLogin, true);
        Preferences.setString(PreferenceKeys.accessToken, response.data!.token);
        Get.offNamed(NavigationName.dashboard);
      });
    }
  }
}
