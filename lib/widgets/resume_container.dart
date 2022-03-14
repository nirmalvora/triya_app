import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';

class ResumeContainer extends StatelessWidget {
  String name;
  ResumeContainer({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: ColorConstant.backgroundColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: TextFontFamily.openSansBold,
                  fontSize: 40.sp,
                  letterSpacing: 2,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward,
                color: ColorConstant.backgroundColor,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
