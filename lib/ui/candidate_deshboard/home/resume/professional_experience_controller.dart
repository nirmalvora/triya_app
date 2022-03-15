import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/professional_experience_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class ProfessionalExperienceController extends GetxController {
  final companyName = TextEditingController();
  final role = TextEditingController();
  final formDate = TextEditingController();
  final endDate = TextEditingController();

  void professionalExperience() {
    Map<String, dynamic> experience = {
      'company_name': companyName.text,
      'role': role.text,
      'from_date': formDate.text,
      'to_date': endDate.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.professionalExperience, data: experience)
        .then((value) {
      ProfessionalExperienceResponse response =
          ProfessionalExperienceResponse.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
