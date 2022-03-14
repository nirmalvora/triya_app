import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';

class CommonContainer extends StatelessWidget {
  String name;
  CommonContainer({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      child: Container(
        height: 140.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstant.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                name,
                style: TextStyle(
                  color: ColorConstant.textColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: TextFontFamily.openSansBold,
                  fontSize: 35.sp,
                  letterSpacing: 2,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
