import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/utils/app_utils.dart';

class EmployerSignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  void employerSignIn() {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        'email': email.text,
        'password': password.text,
      };
      BaseApiService.instance
          .post(ServiceConstant.empSignIn, data: data)
          .then((value) {
        AppUtils.LoginEmployeeSuccess(value!.data);
        // print(value!.data);
      });
    }
  }

  /*void signin() {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        'email': email.text,
        'password': password.text,
      };
      BaseApiService.instance
          .post(ServiceConstant.signIn, data: data)
          .then((value) {
        LoginResponse response = LoginResponse.fromJson(value!.data);
        Get.showSnackbar(GetSnackBar(
          title: response.message,
        ));
      });
    }
  }*/
}
