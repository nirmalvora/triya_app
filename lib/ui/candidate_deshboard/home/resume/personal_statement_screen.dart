import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/personal__statement_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/bottom_common_button.dart';
import 'package:triya_app/widgets/resume_common_textfiled.dart';

class PersonalStatementScreen extends StatelessWidget {
  PersonalStatementScreen({Key? key}) : super(key: key);
  final controller = Get.put(PersonalStatementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommanTopBar(title: "PERSONAL STATEMENT"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TELL SOMETHING About you *',
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
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorConstant.backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ResumeCommonTextField(
                      hintText: "",
                      controller: controller.enterText,
                    ),
                  ),
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
                controller.personalStatement();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CommanTopBar extends StatelessWidget {
  String title;
  CommanTopBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(19), bottomRight: Radius.circular(19)),
        color: ColorConstant.splashColor,
        image: DecorationImage(
          image: AssetImage(
            AppUtils.getPNGAsset(ImageConstant.backgroundImage),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            right: 10,
            left: 10,
            top: MediaQuery.of(context).padding.top + 18.h,
            bottom: 35.h),
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
              title.toUpperCase(),
              style: TextStyle(
                color: ColorConstant.backgroundColor,
                fontWeight: FontWeight.w700,
                fontSize: 35.sp,
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
