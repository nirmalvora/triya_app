import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/utils/app_utils.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: ColorConstant.droverButtonColor,
              radius: 18,
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: Text(
          "Create Your Resume",
          style: TextStyle(color: ColorConstant.splashColor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 22,
              child: Image.asset(
                AppUtils.getPNGAsset(ImageConstant.myProfileIcon),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.normalResumePage);
                },
                child: Container(
                  height: 140.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstant.splashColor,
                  ),
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: const [Color(0xff3782F3), Color(0xff276ED8)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Normal Resume',
                            style: TextStyle(
                              color: ColorConstant.backgroundColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: TextFontFamily.openSansBold,
                              fontSize: 40.sp,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 140.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstant.splashColor,
                ),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: const [Color(0xff3782F3), Color(0xff276ED8)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Normal Resume',
                          style: TextStyle(
                            color: ColorConstant.backgroundColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: TextFontFamily.openSansBold,
                            fontSize: 40.sp,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 140.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstant.splashColor,
                  ),
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: const [Color(0xff3782F3), Color(0xff276ED8)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Normal Resume',
                            style: TextStyle(
                              color: ColorConstant.backgroundColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: TextFontFamily.openSansBold,
                              fontSize: 40.sp,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
