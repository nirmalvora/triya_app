import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/utils/app_utils.dart';

import '../../../services/api_service_methods.dart';

class EmployeLoginScreenController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signIn() {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        'email': email.text,
        'password': password.text,
      };
      BaseApiService.instance
          .post(ServiceConstant.signIn, data: data)
          .then((value) {
        AppUtils.LoginEmployeeSuccess(value!.data);
      });
    }
  }

  final loading = false.obs;

  void loginwithFacebook() async {
    loading.value = true;

    try {
      final facebookLoginresult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      print(userData);
      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginresult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      await FirebaseFirestore.instance.collection('user').add({
        'email': userData['email'],
        'imageurl': userData['picture']['data']['url'],
        'name': userData['name'],
      });
      Get.offAllNamed(NavigationName.dashboard);
    } on FirebaseAuthException catch (e) {
      var content = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          content = 'This account exists with a different sign in provider';
          break;
        case 'invalid-credential':
          content = 'Unknown error has occurred';
          break;
        case 'operation-not-allowed':
          content = 'This operation is not allowed';
          break;
        case 'user-disabled':
          content = 'The user you tried to log into is disabled';
          break;
        case 'user-not-found':
          content = 'The user you tried to log into was not found';
          break;
      }
      Get.snackbar(content, "");
    } finally {
      loading.value = false;
    }
  }
}
