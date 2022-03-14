import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/ui/deshboard/home/resume/key_skills_screen.dart';
import 'package:triya_app/ui/deshboard/home/resume/personal_statement_screen.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/bottom_common_button.dart';
import 'package:triya_app/widgets/resume_common_textfiled.dart';

class AcademicScreen extends StatelessWidget {
  const AcademicScreen({Key? key}) : super(key: key);

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
                      hintText: "",
                    ),
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
                      hintText: "",
                    ),
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
                      hintText: "",
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
                      hintText: "",
                    ),
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
                      hintText: "",
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'DEGREE QUALIFICATION *',
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
                      hintText: "Institute Name",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ResumeCommonTextField(
                            hintText: "From Date*",
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ResumeCommonTextField(
                            hintText: "To date*",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ResumeCommonTextField(
                      hintText: "No Of Backlog",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ResumeCommonTextField(
                      hintText: "Agregated Score (Percentage)*",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ResumeCommonTextField(
                      hintText: "Gap Between Education (Year)*",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ResumeCommonTextField(
                      hintText: "Reason Of Gap Between Education*",
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'MASTERS *',
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
                      hintText: "Institute/Collage Name*",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ResumeCommonTextField(
                      hintText: "Sepcialization*",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ResumeCommonTextField(
                      hintText: "Years Of completion*",
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
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
