import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/local_data/app_state.dart';
import 'package:triya_app/model/login_response.dart';
import 'package:triya_app/model/name_update_response.dart';
import 'package:triya_app/preference/preference_keys.dart';
import 'package:triya_app/preference/prerences.dart';
import 'package:triya_app/services/api_service_methods.dart';

class MyAccountController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final updatesData = Rx<NameUpdateResponse?>(null);

  @override
  void onReady() {
    super.onReady();
  }

  void updateData() {
    Map<String, dynamic> update = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.updateName, data: update)
        .then((value) {
      print(value!.data);

      NameUpdateResponse response = NameUpdateResponse.fromJson(value.data);
      AppState.loginData.value?.user!.firstName = response.data!.firstName;
      AppState.loginData.value?.user!.lastName = response.data!.lastName;
      Preferences.setString(PreferenceKeys.userProfile,
          jsonEncode(LoginResponse(data: AppState.loginData.value).toJson()));
      ;
      AppState.loginData.refresh();
      Get.snackbar(response.message!, "");
    });
  }
}
