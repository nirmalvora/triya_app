import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/local_data/app_state.dart';
import 'package:triya_app/model/login_response.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/preference/preference_keys.dart';
import 'package:triya_app/preference/prerences.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/utils/app_utils.dart';

class CandidateLoginController extends GetxController {
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      BaseApiService.instance.post(
        ServiceConstant.signUp,
        data: {
          "type": "google",
          "uid": value.user!.uid,
          "profile_picture": value.user!.photoURL,
          "display_name": value.user!.displayName,
        },
      ).then((value) {
        AppUtils.LoginEmployeeSuccess(value!.data);
      });
    });
  }
}
