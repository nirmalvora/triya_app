import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/utils/app_utils.dart';

class OtpSubmitController extends GetxController {
  final otpController = TextEditingController();
  String? _verificationCode;
  final mobileNO = "".obs;
  @override
  void onReady() {
    super.onReady();
    final res = Get.arguments;
    if (res != null) {
      mobileNO.value = res[AppConstants.mobileNo];
      verifyPhone();
    }
  }

  verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 $mobileNO',
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("Data");
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            Get.toNamed(NavigationName.dashboard);
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint(e.message);
      },
      codeSent: (String verficationID, int? resendToken) {
        _verificationCode = verficationID;
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        _verificationCode = verificationID;
      },
      timeout: Duration(seconds: 120),
    );
  }

  verifyNumber() async {
    var phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _verificationCode!, smsCode: otpController.text);
    await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential).then(
      (value) {
        BaseApiService.instance.post(
          ServiceConstant.signUp,
          data: {
            "type": "otp_login",
            "mobile": mobileNO.value,
          },
        ).then((value) {
          AppUtils.LoginEmployeeSuccess(value!.data);
        });
      },
    );
  }
}
