import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';

import '../../../utils/app_utils.dart';

class CandidateChooseLoginType extends StatelessWidget {
  const CandidateChooseLoginType({Key? key}) : super(key: key);

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
                  "Find The Right Job",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "OpenSans-Regular",
                      fontSize: 92.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Please choose from below option to enter',
                  style: TextStyle(
                    color: ColorConstant.white,
                    fontSize: 30.sp,
                    fontFamily: "OpenSans-Regular",
                  ),
                ),
                SizedBox(height: 178.h),
                CommanLogInButton(
                    onTap: () {
                      Get.toNamed(NavigationName.otpLogin);
                    },
                    title: 'LOGIN WITH OTP',
                    image: ImageConstant.otp_login),
                SizedBox(height: 36.h),
                CommanLogInButton(
                    onTap: () {},
                    title: 'LOGIN WITH FACEBOOK',
                    image: ImageConstant.facebook_Icon),
                SizedBox(height: 36.h),
                CommanLogInButton(
                    onTap: () {},
                    title: 'LOGIN WITH GOOGLE',
                    image: ImageConstant.google_Icon),
                SizedBox(height: 36.h),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(NavigationName.login);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19.r),
                              border: Border.all(color: ColorConstant.white)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 37.h),
                            child: Center(
                                child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                  color: ColorConstant.white,
                                  fontFamily: "OpenSans-Regular",
                                  fontSize: 32.sp),
                            )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 33.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(NavigationName.signup);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19.r),
                              border: Border.all(color: ColorConstant.white)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 37.h),
                            child: Center(
                                child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  color: ColorConstant.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "OpenSans-Regular",
                                  fontSize: 32.sp),
                            )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CommanLogInButton extends StatelessWidget {
  String title;
  String image;
  Function() onTap;
  CommanLogInButton(
      {Key? key, required this.title, required this.image, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorConstant.white,
            borderRadius: BorderRadius.circular(19.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 32.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: ColorConstant.blue,
                    fontFamily: "OpenSans-Regular",
                    fontWeight: FontWeight.w600,
                    fontSize: 32.sp),
              ),
              SvgPicture.asset(
                AppUtils.getSVGAsset(image),
                height: 55.h,
                width: 42.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
