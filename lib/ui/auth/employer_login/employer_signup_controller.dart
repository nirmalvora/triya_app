import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/sign_up_response.dart';
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

  void signup() {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        'first_name': firstName.text,
        'last_name': lastName.text,
        'email': email.text,
        'type': "Normal",
        'password': password.text,
      };
      BaseApiService.instance
          .post(ServiceConstant.signUp, data: data)
          .then((value) {
        SignUpResponse response = SignUpResponse.fromJson(value!.data);
        Get.snackbar(response.message!, "");
      });
    }
  }
}
