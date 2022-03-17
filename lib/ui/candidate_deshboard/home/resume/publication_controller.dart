import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/professional_certifiacates_response.dart';
import 'package:triya_app/model/publication_response.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/professional_resume_controller.dart';

class PublicationController extends GetxController {
  final titles = TextEditingController();
  final description = TextEditingController();
  @override
  void onReady() {
    super.onReady();
    final resumeViewController = Get.put(ProfileResumeController());
    titles.text = resumeViewController
        .resumeResponse.value?.resumeData?[0].resumePublications?.title ??
        "";
    description.text = resumeViewController.resumeResponse.value?.resumeData?[0]
        .resumePublications?.description ??
        "";
  }

  void publication() {
    Map<String, dynamic> publication = {
      'title': titles.text,
      'description': description.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.publication, data: publication)
        .then((value) {
      PublicationResponse response = PublicationResponse.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
