import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/professional_certifiacates_response.dart';
import 'package:triya_app/model/publication_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class PublicationController extends GetxController {
  final titles = TextEditingController();
  final description = TextEditingController();

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
