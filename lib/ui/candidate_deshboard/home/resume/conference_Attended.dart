import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/conference_attended_controller.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/key_skills_screen.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/personal_statement_screen.dart';
import 'package:triya_app/widgets/bottom_common_button.dart';
import 'package:triya_app/widgets/resume_common_textfiled.dart';

class ConferenceAttendedScreen extends StatelessWidget {
  ConferenceAttendedScreen({Key? key}) : super(key: key);
  final controller = Get.put(ConferenceAttendedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.droverButtonColor,
      body: Column(
        children: [
          CommanTopBar(title: "Conference Attended"),
          SizedBox(height: 45.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*   Row(
                  children: [
                    Text(
                      'Conference 1',
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
                  'Conerence Description'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 30.sp,
                      color: ColorConstant.blueColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: "OpenSans-Regular"),
                ),
                SizedBox(height: 23.h),
                ResumeCommonTextField(
                  hintText: '',
                  controller: controller.description,
                ),
                SizedBox(height: 42.h),
                // CommanAddButton(onTap: () {}, title: 'Add Conference')
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: BottomCommonButton(
                onTap: () {
                  controller.conferenceAttended();
                },
                name: "SAVE"),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 20.h)
        ],
      ),
    );
  }
}
