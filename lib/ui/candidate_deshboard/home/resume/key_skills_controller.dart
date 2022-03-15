import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/key_skills_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class KeySkillsController extends GetxController {
  final keySkills = TextEditingController();

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
