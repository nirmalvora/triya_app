import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';
import 'package:triya_app/widgets/resume_container.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
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
          "Create Your Resume",
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {},
                child: ResumeContainer(name: "NORMAL RESUME"),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: ResumeContainer(name: "STANDARD RESUME"),
            ),*/
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.professionalResumePage);
                },
                child: ResumeContainer(name: "PROFESSIONAL RESUME"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
