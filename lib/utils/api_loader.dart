import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:lottie/lottie.dart';

class ProgressDialogUtils {
  static final ProgressDialogUtils _instance = ProgressDialogUtils.internal();
  static bool _isLoading = false;

  ProgressDialogUtils.internal();

  factory ProgressDialogUtils() => _instance;

  static void dismissProgressDialog() {
    if (_isLoading) {
      Get.back();
      _isLoading = false;
    }
  }

  static Future<void> showProgressDialog() async {
    _isLoading = true;
    await Get.dialog(
      SimpleDialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        children: <Widget>[
          Center(
            child: Lottie.asset(
              "",
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
