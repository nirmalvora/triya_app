import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/utils/common_text_field.dart';

class OTPLoginScreen extends StatelessWidget {
  const OTPLoginScreen({Key? key}) : super(key: key);

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.h),
            child: SingleChildScrollView(
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
                    'Otp Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans-Regular",
                        fontSize: 92.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Please enter your mobile no.',
                    style: TextStyle(
                      color: ColorConstant.white,
                      fontSize: 30.sp,
                      fontFamily: "OpenSans-Regular",
                    ),
                  ),
                  SizedBox(height: 124.h),
                  CommonTextField(hintText: "MOBILE NO *"),
                  SizedBox(height: 70.h),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(NavigationName.otpSubmit);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 36.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(19.r)),
                      child: Center(
                        child: Text(
                          "Send otp".toUpperCase(),
                          style: TextStyle(
                              letterSpacing: 1.5,
                              color: Color(0xff3782F3),
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom + 20.h)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
