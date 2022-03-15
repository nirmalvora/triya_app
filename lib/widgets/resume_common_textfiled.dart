import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triya_app/constants/color_constant.dart';

class ResumeCommonTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const ResumeCommonTextField(
      {Key? key, required this.hintText, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
          color: ColorConstant.backgroundColor,
          borderRadius: BorderRadius.circular(19.r)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              style: TextStyle(color: ColorConstant.textColor),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(
                    color: ColorConstant.hintTextColor, fontSize: 35.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
