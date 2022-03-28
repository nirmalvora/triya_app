import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/academic_history_controller.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/personal_statement_screen.dart';
import 'package:triya_app/widgets/bottom_common_button.dart';
import 'package:triya_app/widgets/resume_common_textfiled.dart';

class AcademicScreen extends StatelessWidget {
  AcademicScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProfessionalExperienceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommanTopBar(title: "ACADEMIC HISTORY"),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SCHOOL NAME *',
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
                      controller: controller.schoolName,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'YEAR OF PASSING *',
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
                        hintText: "", controller: controller.yearOfPassing),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'SSL SCORE (PERCENTAGE) *',
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
                        hintText: "", controller: controller.sslScore),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'SECONDARY DIPLOMA *',
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
                        hintText: "", controller: controller.secondaryDiploma),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'YEAR OF PASSING *',
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
                        controller: controller.yearOfPassingDiploma),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'SCORE (PERCENTAGE) *',
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
                        hintText: "", controller: controller.score),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'DEGREE QUALIFICATION',
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
                      hintText: "Institute Name*",
                      controller: controller.instituteName,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ResumeCommonTextField(
                              hintText: "From Date*",
                              controller: controller.fromDate),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ResumeCommonTextField(
                              hintText: "To date*",
                              controller: controller.toDate),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ResumeCommonTextField(
                        hintText: "No Of Backlog",
                        controller: controller.backing),
                    SizedBox(
                      height: 10,
                    ),
                    ResumeCommonTextField(
                        hintText: "Agregated Score (Percentage)*",
                        controller: controller.agregatedScore),
                    SizedBox(
                      height: 10,
                    ),
                    ResumeCommonTextField(
                        hintText: "Gap Between Education (Year)*",
                        controller: controller.gapEducation),
                    SizedBox(
                      height: 10,
                    ),
                    ResumeCommonTextField(
                        hintText: "Reason Of Gap Between Education*",
                        controller: controller.reasonGap),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'MASTERS',
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
                        hintText: "Institute/Collage Name",
                        controller: controller.masterClgName),
                    SizedBox(
                      height: 10,
                    ),
                    ResumeCommonTextField(
                      hintText: "Sepcialization",
                      controller: controller.specialization,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ResumeCommonTextField(
                      hintText: "Years Of completion",
                      controller: controller.yearOfCompleted,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: BottomCommonButton(
              name: "SAVE",
              onTap: () {
                controller.academicHistory();
              },
            ),
          ),
        ],
      ),
    );
  }
}
