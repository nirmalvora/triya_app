import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/navigation/navigation_constant.dart';

import '../../../utils/app_utils.dart';
import '../../../utils/common_text_field.dart';

class EmployerSignInScreen extends StatelessWidget {
  const EmployerSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(AppUtils.getPNGAsset("login_type_background"),
              fit: BoxFit.cover),
        ),
        Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top + 12.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.w),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            AppUtils.getSVGAsset("back_icon"),
                            height: 115.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 65.0.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30.0.w,
                      ),
                      Expanded(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "OpenSans-Regular",
                              fontSize: 92.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.0.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30.0.w,
                      ),
                      Text(
                        "Please enter email id and password to login.",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "OpenSans-Regular",
                          fontSize: 40.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 58.0.h,
                  ),
                  CommonTextField(hintText: "Email Id *"),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  CommonTextField(hintText: "Password *"),
                  SizedBox(
                    height: 115.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: GestureDetector(
                      onTap: () {
                        Get.offNamed(NavigationName.employerDashboard);
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
                  ),
                  SizedBox(
                    height: 328.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Don’t have an account? ",
                            style: TextStyle(
                                color: Colors.white, fontSize: 30.sp)),
                        TextSpan(
                            text: "Sign Up",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(NavigationName.employerSignUp);
                              },
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        )
      ]),
    );
  }
}
