import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/personal_statement_screen.dart';
import 'package:triya_app/widgets/bottom_common_button.dart';
import 'package:triya_app/widgets/resume_common_textfiled.dart';

class ContactInformationScreen extends StatelessWidget {
  const ContactInformationScreen({Key? key}) : super(key: key);

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
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'ADDRESS *',
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
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Expanded(
                      child: ResumeCommonTextField(
                        hintText: "Area",
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
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Expanded(
                      child: ResumeCommonTextField(
                        hintText: "State",
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
                        hintText: "Pincode",
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
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
