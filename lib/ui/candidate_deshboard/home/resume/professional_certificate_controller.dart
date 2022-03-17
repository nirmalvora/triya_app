import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/professional_certifiacates_response.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/professional_resume_controller.dart';

class ProfessionalCertificateController extends GetxController {
  final titles = TextEditingController();
  final description = TextEditingController();
  @override
  void onReady() {
    super.onReady();
    final resumeViewController = Get.put(ProfileResumeController());
    if ((resumeViewController.resumeResponse.value?.resumeData?.length ?? 0) ==
        0) {
      titles.text = resumeViewController.resumeResponse.value?.resumeData?[0]
              .resumeProfessionalCertifications?.title ??
          "";
      description.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeProfessionalCertifications?.description ??
          "";
    }
  }

  void professionalCertificates() {
    Map<String, dynamic> certificates = {
      'title': titles.text,
      'description': description.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.professionalCertification, data: certificates)
        .then((value) {
      ProfessionalCertificateResponse response =
          ProfessionalCertificateResponse.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
