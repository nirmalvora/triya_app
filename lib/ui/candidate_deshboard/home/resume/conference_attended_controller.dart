import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/conference_attended_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class ConferenceAttendedController extends GetxController {
  final description = TextEditingController();

  void conferenceAttended() {
    Map<String, dynamic> conference = {
      'description': description.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.conferenceAttended, data: conference)
        .then((value) {
      ConferenceAttendedResponse response =
          ConferenceAttendedResponse.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
