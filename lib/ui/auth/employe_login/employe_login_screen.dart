import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/ui/auth/candidate_login/candidate_login_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/utils/common_text_field.dart';

import 'employe_login_screen_controller.dart';

class EmployeLoginScreen extends StatefulWidget {
  const EmployeLoginScreen({Key? key}) : super(key: key);

  @override
  _EmployeLoginScreenState createState() => _EmployeLoginScreenState();
}

class _EmployeLoginScreenState extends State<EmployeLoginScreen> {
  final controller = Get.put(EmployeLoginScreenController());
  final googleController = Get.put(CandidateLoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(AppUtils.getPNGAsset("login_type_background"),
                fit: BoxFit.cover),
          ),
          Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top + 20.h),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(AppUtils.getSVGAsset("back_icon"),
                          height: 115.r),
                    ),
                    SizedBox(height: 69.0.h),
                    Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "OpenSans-Regular",
                          fontSize: 92.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Please enter email id and password to employe_login.',
                      style: TextStyle(
                        color: ColorConstant.white,
                        fontSize: 30.sp,
                        fontFamily: "OpenSans-Regular",
                      ),
                    ),
                    SizedBox(height: 124.h),
                    CommonTextField(
                      hintText: "EMAIL ID *",
                      controller: controller.email,
                      validation: (value) {
                        return validateEmail(value);
                      },
                    ),
                    SizedBox(height: 30.h),
                    CommonTextField(
                      hintText: "PASSWORD *",
                      controller: controller.password,
                      validation: (value) {
                        if (value == null || value == "") {
                          return "Please enter password";
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xff96D7F6),
                              fontSize: 30.sp,
                              fontFamily: "OpenSans-Regular",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 39.h),
                    GestureDetector(
                      onTap: () {
                        controller.signIn();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 36.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(19.r)),
                        child: Center(
                          child: Text(
                            "Login".toUpperCase(),
                            style: TextStyle(
                                letterSpacing: 1.5,
                                color: Color(0xff3782F3),
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 209.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 1.h,
                            width: 91.w,
                            color: ColorConstant.white),
                        SizedBox(width: 36.w),
                        Text(
                          'OR',
                          style: TextStyle(
                            color: ColorConstant.white,
                            fontSize: 30.sp,
                            fontFamily: "OpenSans-Regular",
                          ),
                        ),
                        SizedBox(width: 36.w),
                        Container(
                            height: 1.h,
                            width: 91.w,
                            color: ColorConstant.white),
                      ],
                    ),
                    SizedBox(height: 124.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.loginwithFacebook();
                          },
                          child: Container(
                            height: 164.h,
                            width: 164.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorConstant.white),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60.w, vertical: 40.h),
                              child: SvgPicture.asset(
                                AppUtils.getSVGAsset(
                                    ImageConstant.facebook_Outline),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 36.h),
                        InkWell(
                          onTap: () {
                            googleController.signInWithGoogle();
                          },
                          child: Container(
                            height: 164.h,
                            width: 164.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorConstant.white),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60.w, vertical: 40.h),
                              child: SvgPicture.asset(
                                AppUtils.getSVGAsset(ImageConstant.google_Icon),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 129.h),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Don???t have an account? ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30.sp)),
                            TextSpan(
                                text: "Sign Up",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(NavigationName.signup);
                                  },
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).padding.bottom + 20)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }
}
