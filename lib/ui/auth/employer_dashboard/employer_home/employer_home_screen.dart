import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/utils/app_utils.dart';

class EmployerHomeScreen extends StatelessWidget {
  const EmployerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.splashColor,
        leading: Center(
            child: Padding(
          padding: EdgeInsets.only(left: 30.w, bottom: 30.h),
          child: SvgPicture.asset(
            AppUtils.getSVGAsset(ImageConstant.appbar_icon),
            height: 115.h,
            width: 115.h,
          ),
        )),
        title: Text(
          'My Jobs',
          style: TextStyle(
              fontFamily: "OpenSans-Regular",
              color: ColorConstant.white,
              fontWeight: FontWeight.w700,
              fontSize: 52.sp),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: ClipOval(
              child: Container(
                height: 115.h,
                width: 115.h,
                decoration: BoxDecoration(
                    color: ColorConstant.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffE9E9E9), width: 3)),
                child: ClipOval(
                  child: Image.network(
                    'https://s3-alpha-sig.figma.com/img/5387/ddcd/21388124e311307deee7a85f44bd1b8a?Expires=1648425600&Signature=PyYl48Eck5h8SBcMaDRIyCz-X9rzWs7zsRnfGTyb~zRq2SlR04gvUFTRLdOh48UBqO3j~gV2l55wZ-ZPjfQmLSi8eoh6Wq7D7JatJRFLeOSFfybCrZi~H8GljKEvJVeb-~oQ9FN3zOOPNzlCITqnLSyL8iRio8Ef7ULzfQUAHaDR-TqdbKhQU3HbCRVbQO1PDsvsodqF3WmQnhHGtq7oQxTFK1bgWbQX8-yJ901xP3rs2kKXbDKtL-LfBFepB~-l2zJ7W-KBmotXvAxKo5-AmrO5oNXD6PvymKsSGBcPdid9Y3FewHGVLj0z6IP5-28UBevK796~kI8EGqKNf-uZbw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                    height: 77.h,
                    width: 77.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorConstant.splashColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(34.r),
                      bottomRight: Radius.circular(34.r))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      fillColor: Color(0xff397ADB),
                      filled: true,
                      hintText: 'Search for jobs here...',
                      hintStyle: TextStyle(
                          color: ColorConstant.white,
                          fontSize: 22.sp,
                          fontFamily: "OpenSans-Regular"),
                      prefixIcon: Container(
                        child: SvgPicture.asset(
                          AppUtils.getSVGAsset(ImageConstant.search_icon),
                          height: 40.h,
                          width: 40.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: Color(0xff397ADB))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: Color(0xff397ADB)))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
