import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator? validation;
  const CommonTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(19.r)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              validator: validation,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText.toUpperCase(),
                  contentPadding: EdgeInsets.zero,
                  hintStyle: TextStyle(color: Colors.white, fontSize: 25.sp)),
            ),
          )
        ],
      ),
    );
  }
}
