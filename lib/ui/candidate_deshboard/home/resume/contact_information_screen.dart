import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/contact_information_controller.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/personal_statement_screen.dart';
import 'package:triya_app/widgets/bottom_common_button.dart';
import 'package:triya_app/widgets/resume_common_textfiled.dart';

class ContactInformationScreen extends StatelessWidget {
  ContactInformationScreen({Key? key}) : super(key: key);
  final controller = Get.put(ContactInformationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommanTopBar(title: "CONTACT INFORMATION"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MOBILE NO. *',
                  style: TextStyle(
                    color: ColorConstant.splashColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: TextFontFamily.openSansBold,
                    fontSize: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ResumeCommonTextField(
                  hintText: "",
                  controller: controller.mobileNumber,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'EMAIL ID *',
                  style: TextStyle(
                    color: ColorConstant.splashColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: TextFontFamily.openSansBold,
                    fontSize: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ResumeCommonTextField(
                  hintText: "",
                  controller: controller.emailId,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'ADDRESS',
                  style: TextStyle(
                    color: ColorConstant.splashColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: TextFontFamily.openSansBold,
                    fontSize: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ResumeCommonTextField(
                        hintText: "House No.",
                        controller: controller.houseNo,
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Expanded(
                      child: ResumeCommonTextField(
                        hintText: "Area",
                        controller: controller.area,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ResumeCommonTextField(
                        hintText: "City",
                        controller: controller.city,
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Expanded(
                      child: ResumeCommonTextField(
                        hintText: "State",
                        controller: controller.state,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ResumeCommonTextField(
                        hintText: "PinCode",
                        controller: controller.pinCode,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: BottomCommonButton(
              name: "SAVE",
              onTap: () {
                controller.contactInformation();
              },
            ),
          ),
        ],
      ),
    );
  }
}
