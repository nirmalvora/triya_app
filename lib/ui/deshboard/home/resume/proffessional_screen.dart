import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/ui/deshboard/home/resume/key_skills_screen.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/bottom_common_button.dart';
import 'package:triya_app/widgets/resume_common_textfiled.dart';

class ProfessionalScreen extends StatelessWidget {
  const ProfessionalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorConstant.splashColor,
              image: DecorationImage(
                image: AssetImage(
                  AppUtils.getPNGAsset(ImageConstant.backgroundImage),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xff2C72DB),
                      radius: 20,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Text(
                    'PROFESSIONAL EXPERIENCE',
                    style: TextStyle(
                      color: ColorConstant.backgroundColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 35.sp,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                  )
                ],
              ),
            ),
          ),
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
                            'ADDRESS *',
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
                            'ADDRESS *',
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
            child: BottomCommonButton(name: "SAVE"),
          ),
        ],
      ),
    );
  }
}
