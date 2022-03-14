import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/ui/deshboard/home/resume/key_skills_screen.dart';
import 'package:triya_app/widgets/bottom_common_button.dart';
import 'package:triya_app/widgets/resume_common_textfiled.dart';

import 'personal_statement_screen.dart';

class IndustryAwardScreen extends StatelessWidget {
  IndustryAwardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.droverButtonColor,
      body: Column(
        children: [
          CommanTopBar(title: "Industry Awards"),
          SizedBox(height: 45.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Award 1',
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
                  'Award & Description'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 30.sp,
                      color: ColorConstant.blueColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: "OpenSans-Regular"),
                ),
                SizedBox(height: 23.h),
                ResumeCommonTextField(
                  hintText: '',
                ),
                SizedBox(height: 42.h),
                CommanAddButton(onTap: () {}, title: 'Add Award')
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
