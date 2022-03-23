import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';
import 'package:triya_app/widgets/resume_container.dart';

import 'private_job_resume_selection_controller.dart';

class PrivateJobResumeScreen extends StatelessWidget {
  PrivateJobResumeScreen({Key? key}) : super(key: key);
  final controller = Get.put(PrivateJobResumeSelectionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.privateJobBgColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
          "Private Job",
          style: TextStyle(color: ColorConstant.splashColor),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: AppBarCircleAvtar(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            // ResumeContainer(name: "CREATE RESUME"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.professionalResumePage,
                      arguments: {
                        AppConstants.showApplyButton: true,
                        AppConstants.jobID: controller.jobId.value,
                      });
                },
                child: ResumeContainer(name: "APPLY WITH EXISTING RESUME"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(NavigationName.uploadResumePage, arguments: {
                  AppConstants.showApplyButton: true,
                  AppConstants.jobID: controller.jobId.value,
                });
              },
              child: ResumeContainer(name: "UPLOAD RESUME"),
            ),
          ],
        ),
      ),
    );
  }
}
