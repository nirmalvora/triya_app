import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/ui/auth/employer_login/employer_signup_controller.dart';

import '../../../utils/app_utils.dart';
import '../../../utils/common_text_field.dart';

class EmployerSignUp extends StatelessWidget {
  EmployerSignUp({Key? key}) : super(key: key);
  final controller = Get.put(EmployerSignUpController());
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
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: SvgPicture.asset(
                                    AppUtils.getSVGAsset("back_icon"),
                                    height: 115.r,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 65.0.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Create Account",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "OpenSans-Regular",
                                      fontSize: 92.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 18.0.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Please fillup the details to create your account.",
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
                            CommonTextField(
                                hintText: "First Name *",
                                controller: controller.firstName),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                                hintText: "last Name *",
                                controller: controller.lastName),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                                hintText: "Company Name*",
                                controller: controller.companyName),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                                hintText: "Email Id *",
                                controller: controller.email),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                                hintText: "mobile No*",
                                controller: controller.mobileNo),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonTextField(
                                      hintText: "Office No*",
                                      controller: controller.officeNo),
                                ),
                                SizedBox(width: 30.w),
                                Expanded(
                                  child: CommonTextField(
                                      hintText: "Area*",
                                      controller: controller.area),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.2),
                                      width: 3.w),
                                  borderRadius: BorderRadius.circular(19.r)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DropdownButton<String>(
                                      iconEnabledColor: Colors.white,
                                      hint: Text("country".toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.sp)),
                                      isExpanded: true,
                                      items: <String>['A', 'B', 'C', 'D']
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (_) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.2),
                                      width: 3.w),
                                  borderRadius: BorderRadius.circular(19.r)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DropdownButton<String>(
                                      iconEnabledColor: Colors.white,
                                      hint: Text("State".toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.sp)),
                                      isExpanded: true,
                                      items: <String>['A', 'B', 'C', 'D']
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (_) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.2),
                                      width: 3.w),
                                  borderRadius: BorderRadius.circular(19.r)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DropdownButton<String>(
                                      iconEnabledColor: Colors.white,
                                      hint: Text("city".toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.sp)),
                                      isExpanded: true,
                                      items: <String>['A', 'B', 'C', 'D']
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (_) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                                hintText: "Password *",
                                controller: controller.password),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                                hintText: "Confirm password *",
                                controller: controller.confirmPassword),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 36.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(19.r)),
                              child: Center(
                                child: Text(
                                  "Sign Up".toUpperCase(),
                                  style: TextStyle(
                                      letterSpacing: 1.5,
                                      color: Color(0xff3782F3),
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  30 + MediaQuery.of(context).padding.bottom,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
