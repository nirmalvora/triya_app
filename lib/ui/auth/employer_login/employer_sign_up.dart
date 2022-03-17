import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/ui/auth/employer_login/employer_signup_controller.dart';
import 'package:triya_app/widgets/cache_imageview.dart';

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
                    key: controller.formKey,
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.w, vertical: 30.h),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(19.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.getImage();
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: ColorConstant
                                            .backgroundColor
                                            .withOpacity(0.3),
                                        child: ClipOval(
                                          child: Obx(
                                            () => controller.image.value == null
                                                ? Container()
                                                : Image.file(
                                                    controller.image.value!,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.0.h,
                                    ),
                                    Text(
                                      "Company logo".toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "OpenSans-Regular",
                                        fontSize: 30.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                              hintText: "First Name *",
                              controller: controller.firstName,
                              validation: (value) {
                                if (value == null || value == "") {
                                  return "Please enter firstname";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                              hintText: "last Name *",
                              controller: controller.lastName,
                              validation: (value) {
                                if (value == null || value == "") {
                                  return "Please enter lastname";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                              hintText: "Company Name*",
                              controller: controller.companyName,
                              validation: (value) {
                                if (value == null || value == "") {
                                  return "Please enter company name";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                                hintText: "Email Id *",
                                controller: controller.email,
                                validation: (value) {
                                  return validateEmail(value);
                                }),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                              hintText: "mobile No*",
                              controller: controller.mobileNo,
                              validation: (value) {
                                if (value == null || value == "") {
                                  return "Please enter mobile number";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonTextField(
                                    hintText: "Office No*",
                                    controller: controller.officeNo,
                                    validation: (value) {
                                      if (value == null || value == "") {
                                        return "Please enter office number";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(width: 30.w),
                                Expanded(
                                  child: CommonTextField(
                                    hintText: "Area*",
                                    controller: controller.area,
                                    validation: (value) {
                                      if (value == null || value == "") {
                                        return "Please enter area";
                                      }
                                      return null;
                                    },
                                  ),
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
                              child: Column(
                                children: [
                                  SelectState(
                                    style: TextStyle(
                                        color: ColorConstant.backgroundColor),
                                    dropdownColor: ColorConstant.splashColor,
                                    onCountryChanged: (value) {
                                      controller.countryValue = value;
                                    },
                                    onStateChanged: (value) {
                                      controller.stateValue = value;
                                    },
                                    onCityChanged: (value) {
                                      controller.cityValue = value;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                              hintText: "Password *",
                              controller: controller.password,
                              validation: (value) {
                                if (value == null || value == "") {
                                  return "Please enter password";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                            CommonTextField(
                              hintText: "Confirm password *",
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
                            SizedBox(
                              height: 30.0.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.signup();
                                } else {
                                  Get.back();
                                }
                              },
                              child: Container(
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
                            ),
                            SizedBox(
                              height:
                                  30 + MediaQuery.of(context).padding.bottom,
                            ),
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
