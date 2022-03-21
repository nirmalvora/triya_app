import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';

class AppliedJobs extends StatelessWidget {
  const AppliedJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: ColorConstant.droverButtonColor,
              radius: 18,
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: Text(
          "Applied Jobs",
          style: TextStyle(color: ColorConstant.splashColor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: AppBarCircleAvtar(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
