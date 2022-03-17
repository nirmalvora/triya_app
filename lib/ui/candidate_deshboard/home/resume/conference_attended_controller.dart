import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/conference_attended_response.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/professional_resume_controller.dart';

class ConferenceAttendedController extends GetxController {
  final description = TextEditingController();
  @override
  void onReady() {
    super.onReady();
    final resumeViewController = Get.put(ProfileResumeController());
    if ((resumeViewController.resumeResponse.value?.resumeData?.length ?? 0) ==
        0) {
      description.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeConferenceAttendeds?.description ??
          "";
    }
  }

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
