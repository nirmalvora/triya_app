import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/personal_statement_response.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/professional_resume_controller.dart';

class PersonalStatementController extends GetxController {
  final enterText = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    final resumeViewController = Get.put(ProfileResumeController());
    if ((resumeViewController.resumeResponse.value?.resumeData?.length ?? 0) !=
        0) {
      enterText.text = resumeViewController
              .resumeResponse.value?.resumeData?[0].tellSomethingAboutYou ??
          "";
    }
  }

  void personalStatement() {
    Map<String, dynamic> statement = {
      'tell_something_about_you': enterText.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.personalStatement, data: statement)
        .then((value) {
      PersonalStatementResponse response =
          PersonalStatementResponse.fromJson(value!.data);
      final resumeViewController = Get.put(ProfileResumeController());
      resumeViewController.getData();
      Get.snackbar(response.message!, "");
    });
  }
}
