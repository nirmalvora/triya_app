import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/utils/app_utils.dart';

class OTPSubmitScreen extends StatelessWidget {
  const OTPSubmitScreen({Key? key}) : super(key: key);

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
                    'We have sent an otp to your mobile no 7890******',
                    style: TextStyle(
                      color: ColorConstant.white,
                      fontSize: 30.sp,
                      fontFamily: "OpenSans-Regular",
                    ),
                  ),
                  SizedBox(height: 124.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(19.r)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter otp'.toUpperCase(),
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 25.sp)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'RESEND',
                            style: TextStyle(
                                letterSpacing: 1.5,
                                color: Color(0xffB4F3FF),
                                fontFamily: "OpenSans-Regular",
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 70.h),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(NavigationName.otpLogin);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 36.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(19.r)),
                      child: Center(
                        child: Text(
                          "Submit".toUpperCase(),
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
