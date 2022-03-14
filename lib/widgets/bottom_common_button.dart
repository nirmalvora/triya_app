import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';

class BottomCommonButton extends StatelessWidget {
  String name;
  Function() onTap;
  BottomCommonButton({Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstant.splashColor,
        ),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: const [Color(0xff3782F3), Color(0xff276ED8)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                color: ColorConstant.backgroundColor,
                fontWeight: FontWeight.w600,
                fontFamily: TextFontFamily.openSansBold,
                fontSize: 35.sp,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
