import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  const CommonTextField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(19.r)),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText.toUpperCase(),
                    contentPadding: EdgeInsets.zero,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 25.sp)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
