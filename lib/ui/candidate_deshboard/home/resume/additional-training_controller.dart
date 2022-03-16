import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/additional_training_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class AdditionalTrainingController extends GetxController {
  final companyName = TextEditingController();
  final secialization = TextEditingController();
  final description = TextEditingController();

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
      Get.snackbar(response.message!, "");
    });
  }
}
