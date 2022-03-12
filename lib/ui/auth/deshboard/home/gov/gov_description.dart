import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/utils/app_utils.dart';

class GovDescription extends StatefulWidget {
  const GovDescription({Key? key}) : super(key: key);

  @override
  _GovDescriptionState createState() => _GovDescriptionState();
}

class _GovDescriptionState extends State<GovDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: ColorConstant.droverButtonColor,
              radius: 18,
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: Text(
          "GOVT.JOBS",
          style: TextStyle(color: ColorConstant.splashColor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 22,
              child: Image.asset(
                AppUtils.getPNGAsset(ImageConstant.myProfileIcon),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: ColorConstant.backgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xffF5F5F5),
                      filled: true,
                      hintText: "Search for book category here",
                      hintStyle: TextStyle(
                        fontSize: 26.h,
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 48,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.h),
                    color: ColorConstant.droverButtonColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppUtils.getSVGAsset(ImageConstant.filterIcon),
                      width: 52.h,
                      height: 47.h,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Text(
              'Staff Car Driver(Ordinary Grade de)',
              style: TextStyle(
                color: ColorConstant.textColor,
                fontWeight: FontWeight.w600,
                fontFamily: TextFontFamily.openSansBold,
                fontSize: 52.sp,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Container(
                  height: 140.h,
                  width: 350.h,
                  decoration: BoxDecoration(
                    color: ColorConstant.backgroundColor,
                    borderRadius: BorderRadius.circular(30.h),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '',
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: TextFontFamily.openSansBold,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
