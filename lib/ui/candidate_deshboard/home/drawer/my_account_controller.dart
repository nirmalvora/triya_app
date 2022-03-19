import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/name_update_response.dart';

import 'package:triya_app/services/api_service_methods.dart';

class MyAccountController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final updatesData = Rx<NameUpdateResponse?>(null);

  @override
  void onReady() {
    super.onReady();
    updateData();
  }

  void updateData() {
    Map<String, dynamic> update = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.updateName, data: update)
        .then((value) {
      NameUpdateResponse response = NameUpdateResponse.fromJson(value!.data);
      print(value.data);
      Get.snackbar(response.message!, "");
    });
  }

  void getUpdate() {
    BaseApiService.instance.get(ServiceConstant.updateName).then((value) {
      NameUpdateResponse response = NameUpdateResponse.fromJson(value!.data);
      updatesData.value = response;
      updateData();
      updatesData.refresh();
    });
  }
}
