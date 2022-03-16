import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/scholarship/scholarship_job_deatil_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/utils/date_formatter.dart';

class ScholarshipDescription extends StatefulWidget {
  const ScholarshipDescription({Key? key}) : super(key: key);

  @override
  _ScholarshipDescriptionState createState() => _ScholarshipDescriptionState();
}

class _ScholarshipDescriptionState extends State<ScholarshipDescription> {
  final controller = Get.put(ScholarshipJobDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.scholarshipJobBgColor,
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
          "GOVT.JOBS",
          style: TextStyle(color: ColorConstant.splashColor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 22,
              child: Image.asset(
                AppUtils.getPNGAsset(ImageConstant.myProfileIcon),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: ColorConstant.backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xffF5F5F5),
                        filled: true,
                        hintText: "Search for book category here",
                        hintStyle: TextStyle(
                          fontSize: 26.h,
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 48,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.h),
                      color: ColorConstant.droverButtonColor,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppUtils.getSVGAsset(ImageConstant.filterIcon),
                        width: 52.h,
                        height: 47.h,
                      ),
                    ),
                  )
                ],
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Text(
                controller.govJob.value?.title ?? "",
                style: TextStyle(
                  color: ColorConstant.textColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: TextFontFamily.openSansBold,
                  fontSize: 52.sp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    height: 125.h,
                    width: 350.h,
                    decoration: BoxDecoration(
                      color: ColorConstant.backgroundColor,
                      borderRadius: BorderRadius.circular(30.h),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Post Date:',
                            style: TextStyle(
                              color: ColorConstant.hintTextColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: TextFontFamily.openSansBold,
                              fontSize: 25.sp,
                            ),
                          ),
                          Spacer(),
                          Text(
                            DateFormatter.convertDateFromString(
                                controller.govJob.value?.postDate ?? "",
                                format: "dd-MMM-yyyy"),
                            style: TextStyle(
                              color: ColorConstant.textColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: TextFontFamily.openSansBold,
                              fontSize: 35.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 125.h,
                    width: 350.h,
                    decoration: BoxDecoration(
                      color: ColorConstant.backgroundColor,
                      borderRadius: BorderRadius.circular(30.h),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last Date:',
                            style: TextStyle(
                              color: ColorConstant.hintTextColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: TextFontFamily.openSansBold,
                              fontSize: 25.sp,
                            ),
                          ),
                          Spacer(),
                          Text(
                            DateFormatter.convertDateFromString(
                                controller.govJob.value?.lastDate ?? "",
                                format: "dd-MMM-yyyy"),
                            style: TextStyle(
                              color: ColorConstant.textColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: TextFontFamily.openSansBold,
                              fontSize: 35.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Container(
                height: 135.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.backgroundColor,
                  borderRadius: BorderRadius.circular(30.h),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qualification:',
                        style: TextStyle(
                          color: ColorConstant.hintTextColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextFontFamily.openSansBold,
                          fontSize: 25.sp,
                        ),
                      ),
                      Spacer(),
                      Text(
                        controller.govJob.value?.qualification ?? "",
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextFontFamily.openSansBold,
                          fontSize: 35.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 135.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.backgroundColor,
                  borderRadius: BorderRadius.circular(30.h),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Board:',
                        style: TextStyle(
                          color: ColorConstant.hintTextColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextFontFamily.openSansBold,
                          fontSize: 25.sp,
                        ),
                      ),
                      Spacer(),
                      Text(
                        controller.govJob.value?.board ?? "",
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextFontFamily.openSansBold,
                          fontSize: 35.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Container(
                height: 135.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.backgroundColor,
                  borderRadius: BorderRadius.circular(30.h),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Job Link:',
                        style: TextStyle(
                          color: ColorConstant.hintTextColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextFontFamily.openSansBold,
                          fontSize: 25.sp,
                        ),
                      ),
                      Spacer(),
                      Text(
                        controller.govJob.value?.jobLink ?? "",
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextFontFamily.openSansBold,
                          fontSize: 35.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.backgroundColor,
                  borderRadius: BorderRadius.circular(30.h),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Job Details:',
                        style: TextStyle(
                          color: ColorConstant.hintTextColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextFontFamily.openSansBold,
                          fontSize: 25.sp,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        controller.govJob.value?.jobDescription ?? "",
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: TextFontFamily.openSansBold,
                          fontSize: 35.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Container(
                height: 110.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstant.splashColor,
                ),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: const [Color(0xff3782F3), Color(0xff276ED8)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Download Pdf',
                              style: TextStyle(
                                color: ColorConstant.backgroundColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: TextFontFamily.openSansBold,
                                fontSize: 40.sp,
                                letterSpacing: 2,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.file_download,
                              color: ColorConstant.backgroundColor,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 20,
            )
          ],
        ),
      ),
    );
  }
}
