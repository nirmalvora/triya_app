import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/contact_information_response.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/professional_resume_controller.dart';

class ContactInformationController extends GetxController {
  final mobileNumber = TextEditingController();
  final emailId = TextEditingController();
  final houseNo = TextEditingController();
  final area = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final pinCode = TextEditingController();
  @override
  void onReady() {
    super.onReady();
    final resumeViewController = Get.put(ProfileResumeController());
    if ((resumeViewController.resumeResponse.value?.resumeData?.length ?? 0) ==
        0) {}
  }

  void contactInformation() {
    Map<String, dynamic> information = {
      'mobile_no': mobileNumber.text,
      'email': emailId.text,
      'house_no': houseNo.text,
      'area': area.text,
      'city': city.text,
      'state': state.text,
      'pin_code': pinCode.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.contactInformation, data: information)
        .then((value) {
      ContactInformationResponse response =
          ContactInformationResponse.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
