import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/utils/app_utils.dart';

class EmployerLogin extends StatelessWidget {
  const EmployerLogin({Key? key}) : super(key: key);

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
                    "Find The Right Candidate",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans-Regular",
                        fontSize: 92.sp,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 30.0.w,
                ),
                Text(
                  "Please choose from below option to enter",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "OpenSans-Regular",
                    fontSize: 30.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 58.0.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 33.w,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(NavigationName.employerLogin);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.r),
                        border: Border.all(width: 3.w, color: Colors.white),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 37.h),
                      child: Center(
                        child: Text("Sign In".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white, fontSize: 32.sp)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 33.w,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(NavigationName.employerSignUp);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.r),
                        border: Border.all(width: 3.w, color: Colors.white),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 37.h),
                      child: Center(
                        child: Text("Sign Up".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white, fontSize: 32.sp)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 33.w,
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
