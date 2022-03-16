import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/conference_attended_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class AdditionalTrainingController extends GetxController {
  final companyName = TextEditingController();
  final secialization = TextEditingController();
  final description = TextEditingController();

  void additionalTraining() {
    Map<String, dynamic> conference = {
      'description': companyName.text,
      'description': secialization.text,
      'description': description.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.additionalTraining, data: conference)
        .then((value) {
      ConferenceAttendedResponse response =
          ConferenceAttendedResponse.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
