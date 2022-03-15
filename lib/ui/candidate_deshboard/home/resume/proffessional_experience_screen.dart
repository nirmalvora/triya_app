import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/model/professional_experience_response.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/key_skills_screen.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/personal_statement_screen.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/professional_experience_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/bottom_common_button.dart';
import 'package:triya_app/widgets/resume_common_textfiled.dart';

class ProfessionalScreen extends StatelessWidget {
  ProfessionalScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProfessionalExperienceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommanTopBar(title: "PROFESSIONAL EXPERIENCE"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Experience 1',
                      style: TextStyle(
                        color: ColorConstant.textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 52.sp,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SvgPicture.asset(
                      AppUtils.getSVGAsset(ImageConstant.closeIcon),
                      height: 54.h,
                      width: 54.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 46.h,
                ),
                Text(
                  'COMPANY NAME *',
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
                  controller: controller.companyName,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'ROLE *',
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
                  controller: controller.role,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FROM MM/YY *',
                            style: TextStyle(
                              color: ColorConstant.splashColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: TextFontFamily.openSansBold,
                              fontSize: 25.sp,
                            ),
                          ),
                          SizedBox(
                            height: 23.h,
                          ),
                          ResumeCommonTextField(
                            hintText: "House No.",
                            controller: controller.formDate,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TO MM/YY *',
                            style: TextStyle(
                              color: ColorConstant.splashColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: TextFontFamily.openSansBold,
                              fontSize: 25.sp,
                            ),
                          ),
                          SizedBox(
                            height: 23.h,
                          ),
                          ResumeCommonTextField(
                            hintText: "Area",
                            controller: controller.endDate,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                CommanAddButton(title: "ADD EXPERIENCE", onTap: () {})
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: BottomCommonButton(
                onTap: () {
                  controller.professionalExperience();
                },
                name: "SAVE"),
          ),
        ],
      ),
    );
  }
}
