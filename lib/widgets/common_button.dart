import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/text_style.dart';

class CommonButton extends StatelessWidget {
  final String btnName;
  final VoidCallback onTap;
  final Color? btnColor;
  final Color? txtColor;
  final double? height;
  final double? width;

  const CommonButton({
    Key? key,
    required this.btnName,
    required this.onTap,
    this.btnColor,
    this.txtColor,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: height ?? 40,
        width: width ?? Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: btnColor ?? ColorConstant.black),
        child: Text(
          btnName,
          style: TextStyleRes.body2m
              .copyWith(color: txtColor ?? ColorConstant.white),
        ),
      ),
    );
  }
}
