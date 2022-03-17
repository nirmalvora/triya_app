import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triya_app/constants/color_constant.dart';

class CommanTopBarField extends StatelessWidget {
  Widget widget;
  CommanTopBarField({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstant.splashColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(34.r),
              bottomRight: Radius.circular(34.r))),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: widget),
    );
  }
}
