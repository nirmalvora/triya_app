import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triya_app/constants/color_constant.dart';

customInputDecoration(hintText, color, borderColor,
        {Widget? suffixIcon, Widget? prefixIcon}) =>
    InputDecoration(
      hintText: hintText,
      fillColor: color,
      filled: true,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      isDense: true,
      hintStyle: TextStyle(
          color: ColorConstant.white,
          fontSize: 12,
          fontFamily: "OpenSans-Regular"),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19.r),
          borderSide: BorderSide(color: borderColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19.r),
          borderSide: BorderSide(color: borderColor)),
    );
