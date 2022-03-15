import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/professional_affiliation_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class ProfessionalAffiliationController extends GetxController {
  final titles = TextEditingController();
  final description = TextEditingController();

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
