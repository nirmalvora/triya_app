import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/key_skills_response.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/professional_resume_controller.dart';

class KeySkillsController extends GetxController {
  final keySkills = TextEditingController();
  @override
  void onReady() {
    super.onReady();

    final resumeViewController = Get.put(ProfileResumeController());
    if ((resumeViewController.resumeResponse.value?.resumeData?.length ?? 0) !=
        0) {
      keySkills.text = resumeViewController
              .resumeResponse.value?.resumeData?[0].resumeKeySkills?.skill ??
          "";
    }
  }

  void keySkill() {
    Map<String, dynamic> history = {
      'skill': keySkills.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.keySkills, data: history)
        .then((value) {
      KeySkillsResponse response = KeySkillsResponse.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
