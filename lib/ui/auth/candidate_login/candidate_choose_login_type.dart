import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_utils.dart';

class CandidateChooseLoginType extends StatelessWidget {
  const CandidateChooseLoginType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(AppUtils.getPNGAsset("login_type_background"),
                fit: BoxFit.cover),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0.w),
                child: Text(
                  "Find The Right Job",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "OpenSans-Regular",
                      fontSize: 92.sp,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
