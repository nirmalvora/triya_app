import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/ui/deshboard/home/resume/key_skills_screen.dart';
import 'package:triya_app/ui/deshboard/home/resume/personal_statement_screen.dart';
import 'package:triya_app/widgets/bottom_common_button.dart';
import 'package:triya_app/widgets/resume_common_textfiled.dart';

class AdditionalTrainingScreen extends StatelessWidget {
  const AdditionalTrainingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.droverButtonColor,
      body: Column(
        children: [
          CommanTopBar(title: "Additional Training"),
          SizedBox(height: 45.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Training 1',
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
                SizedBox(height: 45.h),
                Text(
                  'Company Name/ Training Center'.toUpperCase(),
                  style: TextStyle(
                      color: ColorConstant.blueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 30.sp,
                      fontFamily: "OpenSans-Regular"),
                ),
                SizedBox(height: 23.h),
                ResumeCommonTextField(
                  hintText: '',
                ),
                SizedBox(height: 45.h),
                Text(
                  'Secialization Field'.toUpperCase(),
                  style: TextStyle(
                      color: ColorConstant.blueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 30.sp,
                      fontFamily: "OpenSans-Regular"),
                ),
                SizedBox(height: 23.h),
                ResumeCommonTextField(
                  hintText: '',
                ),
                SizedBox(height: 45.h),
                Text(
                  'Description'.toUpperCase(),
                  style: TextStyle(
                      color: ColorConstant.blueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 30.sp,
                      fontFamily: "OpenSans-Regular"),
                ),
                SizedBox(height: 23.h),
                ResumeCommonTextField(
                  hintText: '',
                ),
                SizedBox(height: 42.h),
                CommanAddButton(onTap: () {}, title: 'Add Training')
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: BottomCommonButton(onTap: () {}, name: "SAVE"),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 20.h)
        ],
      ),
    );
  }
}
