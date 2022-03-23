import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/local_data/app_state.dart';
import 'package:triya_app/model/login_response.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/preference/preference_keys.dart';
import 'package:triya_app/preference/prerences.dart';
import 'package:triya_app/utils/app_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Preferences.init();
    initialMethod();
    super.initState();
  }

  initialMethod() {
    navigationMethod();
  }

  void navigationMethod() {
    Future.delayed(const Duration(seconds: 3), () {
      if (Preferences.getBool(PreferenceKeys.isLogin, false)) {
        AppState.loginData.value = LoginResponse.fromJson(jsonDecode(
                Preferences.getString(PreferenceKeys.userProfile, "")))
            .data;
        if (Preferences.getInt(PreferenceKeys.userRole, -1) == 2) {
          Get.offAllNamed(NavigationName.dashboard);
        } else {
          Get.offAllNamed(NavigationName.employerDashboard);
        }
      } else {
        Get.offAllNamed(NavigationName.loginTypePage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(AppUtils.getPNGAsset("splash_background"),
                fit: BoxFit.cover),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 286.h,
                  width: 286.h,
                  decoration: BoxDecoration(
                    color: ColorConstant.backgroundColor,
                    borderRadius: BorderRadius.circular(65.h),
                  ),
                  child: Center(
                    child: Image.asset(
                      AppUtils.getPNGAsset(ImageConstant.appLogoIcon),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Triya',
                  style: TextStyle(
                    color: ColorConstant.backgroundColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 72.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
