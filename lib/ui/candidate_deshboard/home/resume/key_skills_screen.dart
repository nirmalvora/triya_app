import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/key_skills_controller.dart';
import 'package:triya_app/widgets/bottom_common_button.dart';
import 'package:triya_app/widgets/resume_common_textfiled.dart';

import 'personal_statement_screen.dart';

class KeySkillsScreen extends StatelessWidget {
  KeySkillsScreen({Key? key}) : super(key: key);
  final controller = Get.put(KeySkillsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.droverButtonColor,
      body: Column(
        children: [
          CommanTopBar(title: "KEY SKILLS"),
          SizedBox(height: 45.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* Row(
                  children: [
                    Text(
                      'Skill 1',
                      style: TextStyle(
                          fontSize: 52.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: "OpenSans-Regular"),
                    ),
                    SizedBox(width: 16.w),
                    Container(
                      height: 54.h,
                      width: 54.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffACC7F0)),
                          shape: BoxShape.circle),
                      child: Icon(Icons.close, size: 38.w),
                    )
                  ],
                ),
                SizedBox(height: 45.h),*/
                Text(
                  'Add skill*'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 30.sp,
                      color: ColorConstant.blueColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: "OpenSans-Regular"),
                ),
                SizedBox(height: 23.h),
                ResumeCommonTextField(
                  hintText: '',
                  controller: controller.keySkills,
                ),
                SizedBox(height: 42.h),
                // CommanAddButton(onTap: () {}, title: 'ADD SKILL')
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: BottomCommonButton(
                onTap: () {
                  controller.keySkill();
                },
                name: "SAVE"),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 20.h)
        ],
      ),
    );
  }
}

class CommanAddButton extends StatelessWidget {
  String title;
  Function() onTap;
  CommanAddButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xffACC7F0),
            borderRadius: BorderRadius.circular(19.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 37.h),
          child: Center(
              child: Text(
            title.toUpperCase(),
            style: TextStyle(
                fontFamily: "OpenSans-Regular",
                color: ColorConstant.white,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
                fontSize: 32.sp),
          )),
        ),
      ),
    );
  }
}
