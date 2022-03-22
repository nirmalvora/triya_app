import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/additional_training_response.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/professional_resume_controller.dart';

class AdditionalTrainingController extends GetxController {
  final companyName = TextEditingController();
  final secialization = TextEditingController();
  final description = TextEditingController();
  @override
  void onReady() {
    super.onReady();

    final resumeViewController = Get.put(ProfileResumeController());

    if ((resumeViewController.resumeResponse.value?.resumeData?.length ?? 0) !=
        0) {
      companyName.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeAdditionalTrains?.companyName ??
          "";
      secialization.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeAdditionalTrains?.secialization ??
          "";
      description.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeAdditionalTrains?.description ??
          "";
    }
  }

  void additionalTraining() {
    Map<String, dynamic> training = {
      'company_name': companyName.text,
      'secialization': secialization.text,
      'description': description.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.additionalTraining, data: training)
        .then((value) {
      AdditionalTrainingResponse response =
          AdditionalTrainingResponse.fromJson(value!.data);
      final resumeViewController = Get.put(ProfileResumeController());
      resumeViewController.getData();
      Get.snackbar(response.message!, "");
    });
  }
}
