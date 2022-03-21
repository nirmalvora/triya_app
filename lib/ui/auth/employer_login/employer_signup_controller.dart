import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/candidate_sign_up_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class EmployerSignUpController extends GetxController {
  String? countryValue;
  String? stateValue;
  String? cityValue;
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final companyName = TextEditingController();
  final email = TextEditingController();
  final mobileNo = TextEditingController();
  final officeNo = TextEditingController();
  final area = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    signup();
  }

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      final formData = Dio.FormData.fromMap({
        // 'company_logo': await Dio.MultipartFile.fromFile(image.value!.path),
        'first_name': firstName.text,
        'last_name': lastName.text,
        'company_name': companyName.text,
        'email': email.text,
        'mobile': mobileNo.text,
        'office_no': officeNo.text,
        'area': area.text,
        'country': countryValue,
        'state': stateValue,
        'city': cityValue,
        'password': password.text,
        'confirm_password': confirmPassword.text,
      });
      BaseApiService.instance
          .postForm(ServiceConstant.employerCandidate, data: formData)
          .then((value) {
        print(value!.data);

        CandidateSignUpResponse response =
            CandidateSignUpResponse.fromJson(value.data);
        print(formData.length);

        if (!(response.errors ?? true)) {
          Get.back();
        }
      });
    }
  }

  final picker = ImagePicker();
  Rx<File?> image = Rx<File?>(null);
  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
    image.refresh();
  }
}
