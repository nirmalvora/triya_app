import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/professional_affiliation_response.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/professional_resume_controller.dart';

class ProfessionalAffiliationController extends GetxController {
  final titles = TextEditingController();
  final description = TextEditingController();
  @override
  void onReady() {
    super.onReady();
    final resumeViewController = Get.put(ProfileResumeController());
    titles.text = resumeViewController.resumeResponse.value?.resumeData?[0]
            .resumeProfessionalAffiliations?.title ??
        "";
    description.text = resumeViewController.resumeResponse.value?.resumeData?[0]
            .resumeProfessionalAffiliations?.description ??
        "";
  }

  void professionalAffiliation() {
    Map<String, dynamic> affiliation = {
      'title': titles.text,
      'description': description.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.professionalAffiliations, data: affiliation)
        .then((value) {
      ProfessionalAffiliationResponse response =
          ProfessionalAffiliationResponse.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
