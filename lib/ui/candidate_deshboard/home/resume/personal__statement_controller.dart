import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/personal_statement_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class PersonalStatementController extends GetxController {
  final enterText = TextEditingController();

  void personalStatement() {
    Map<String, dynamic> statement = {
      'tell_something_about_you': enterText.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.personalStatement, data: statement)
        .then((value) {
      PersonalStatementResponse response =
          PersonalStatementResponse.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
