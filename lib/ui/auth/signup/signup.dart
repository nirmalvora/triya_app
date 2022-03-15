import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/ui/auth/signup/signup_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/utils/common_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final controller = Get.put(SignUpController());
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
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.h),
              child: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                            AppUtils.getSVGAsset("back_icon"),
                            height: 115.r),
                      ),
                      SizedBox(height: 69.0.h),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "OpenSans-Regular",
                            fontSize: 92.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Please fillup the details to sign up.',
                        style: TextStyle(
                          color: ColorConstant.white,
                          fontSize: 30.sp,
                          fontFamily: "OpenSans-Regular",
                        ),
                      ),
                      SizedBox(height: 124.h),
                      CommonTextField(
                        hintText: "FIRST NAME *",
                        controller: controller.firstName,
                        validation: (value) {
                          if (value == null || value == "") {
                            return "Please enter firstname";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30.h),
                      CommonTextField(
                        hintText: "LAST NAME Id *",
                        controller: controller.lastName,
                        validation: (value) {
                          if (value == null || value == "") {
                            return "Please enter lastname";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30.h),
                      CommonTextField(
                        hintText: "EMAIL ID *",
                        controller: controller.email,
                        validation: (value) {
                          if (value == null || value == "") {
                            return "Please enter email";
                          }
                          return null;
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
                      SizedBox(height: 30.h),
                      CommonTextField(
                        hintText: "CONFIRM PASSWORD *",
                        controller: controller.confirmPassword,
                        validation: (value) {
                          if (value == null || value == "") {
                            return "Please enter confirm password";
                          } else if (controller.password.text !=
                              controller.confirmPassword.text) {
                            return "password and confirm password doesn't match";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 96.h),
                      GestureDetector(
                        onTap: () {
                          controller.signup();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 36.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(19.r)),
                          child: Center(
                            child: Text(
                              "Signup".toUpperCase(),
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
                            onTap: () {},
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
                            onTap: () {},
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
                                      ImageConstant.google_Icon),
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
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30.sp)),
                              TextSpan(
                                  text: "Sign In",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed(
                                          NavigationName.employerSignUp);
                                    },
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 20.h)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
