import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';

class PersonalStatementScreen extends StatelessWidget {
  const PersonalStatementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'TELL SOMETHING About you *',
              style: TextStyle(
                color: ColorConstant.splashColor,
                fontWeight: FontWeight.w600,
                fontFamily: TextFontFamily.openSansBold,
                fontSize: 25.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
