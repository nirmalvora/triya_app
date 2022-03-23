import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/upload_resume_controller.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';
import 'package:path/path.dart';

class UploadResumeScreen extends StatelessWidget {
  UploadResumeScreen({Key? key}) : super(key: key);
  final controller = Get.put(UploadResumeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
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
          "Upload Resume",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.getPdf();
                  },
                  child: Row(
                    children: [
                      Text(
                        'Upload Resume',
                        style: TextStyle(
                          color: Color(0xff286FD9),
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "OpenSans-Regular",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          Icons.upload_rounded,
                          color: Color(0xff286FD9),
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => Text(
                      basename(controller.files.value?.path ?? ""),
                      style: TextStyle(
                        color: ColorConstant.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: TextFontFamily.openSansBold,
                        fontSize: 32.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 96.h,
            ),
            GestureDetector(
              onTap: () {
                if (controller.files.value?.path != null) {
                  controller.applyJob();
                  Get.back();
                } else {
                  Get.snackbar("FIle not selected", "Please select the file");
                }
              },
              child: Container(
                height: 110.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19.r),
                  border: Border.all(
                    color: ColorConstant.splashColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Apply Job',
                    style: TextStyle(
                      color: ColorConstant.splashColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: TextFontFamily.openSansBold,
                      fontSize: 32.sp,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
