import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/industry_award_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class IndustryAwardController extends GetxController {
  final industry = TextEditingController();

  void industryAward() {
    Map<String, dynamic> industryDesc = {
      'award_description': industry.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.industryAward, data: industryDesc)
        .then((value) {
      IndustryAwardsResponse response =
          IndustryAwardsResponse.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
