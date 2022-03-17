import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/local_data/app_state.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/resume_view_controller.dart';
import 'package:triya_app/utils/app_utils.dart';

class PrivateResumeApply extends StatelessWidget {
  PrivateResumeApply({Key? key}) : super(key: key);
  final controller = Get.put(ResumeViewController());
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
        centerTitle: true,
        title: Text(
          "YOUR RESUME",
          style: TextStyle(color: ColorConstant.splashColor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      color: ColorConstant.privateJobBgColor,
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 460.h,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 150.h,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            StackWidget(name: "PERSONAL STATEMENT"),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                controller.resumeResponse.value?.resumeData?[0]
                                        .tellSomethingAboutYou ??
                                    "",
                                style: TextStyle(
                                  color: ColorConstant.textColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: TextFontFamily.openSensRegular,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            StackWidget(name: "CONTACT INFORMATION"),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'COMPANY NAME',
                                    style: TextStyle(
                                      color: ColorConstant.splashColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                  Text(
                                    controller
                                            .resumeResponse
                                            .value
                                            ?.resumeData?[0]
                                            .resumeProfessionalExperiences
                                            ?.companyName ??
                                        "",
                                    style: TextStyle(
                                      color: ColorConstant.textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 35.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Text(
                                    'ROLE',
                                    style: TextStyle(
                                      color: ColorConstant.splashColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                  Text(
                                    controller
                                            .resumeResponse
                                            .value
                                            ?.resumeData?[0]
                                            .resumeProfessionalExperiences
                                            ?.role ??
                                        "",
                                    style: TextStyle(
                                      color: ColorConstant.textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 35.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'FROM DATE',
                                            style: TextStyle(
                                              color: ColorConstant.splashColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 30.sp,
                                            ),
                                          ),
                                          Text(
                                            controller
                                                    .resumeResponse
                                                    .value
                                                    ?.resumeData?[0]
                                                    .resumeProfessionalExperiences
                                                    ?.fromDate ??
                                                "",
                                            style: TextStyle(
                                              color: ColorConstant.textColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 35.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'To DATE',
                                            style: TextStyle(
                                              color: ColorConstant.splashColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 30.sp,
                                            ),
                                          ),
                                          Text(
                                            controller
                                                    .resumeResponse
                                                    .value
                                                    ?.resumeData?[0]
                                                    .resumeProfessionalExperiences
                                                    ?.toDate ??
                                                "",
                                            style: TextStyle(
                                              color: ColorConstant.textColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 35.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            StackWidget(name: "ACADEMIC HISTORY"),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SCHOOL NAME',
                                    style: TextStyle(
                                      color: ColorConstant.splashColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                  Text(
                                    controller
                                            .resumeResponse
                                            .value
                                            ?.resumeData?[0]
                                            .resumeAcademicHistories
                                            ?.schoolName ??
                                        "",
                                    style: TextStyle(
                                      color: ColorConstant.textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 35.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Text(
                                    'YEAR OF PASSING',
                                    style: TextStyle(
                                      color: ColorConstant.splashColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                  Text(
                                    controller
                                            .resumeResponse
                                            .value
                                            ?.resumeData?[0]
                                            .resumeAcademicHistories
                                            ?.yearOfPassing ??
                                        "",
                                    style: TextStyle(
                                      color: ColorConstant.textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 35.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'FROM DATE',
                                            style: TextStyle(
                                              color: ColorConstant.splashColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 30.sp,
                                            ),
                                          ),
                                          Text(
                                            controller
                                                    .resumeResponse
                                                    .value
                                                    ?.resumeData?[0]
                                                    .resumeAcademicHistories
                                                    ?.fromDate ??
                                                "",
                                            style: TextStyle(
                                              color: ColorConstant.textColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 35.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'To DATE',
                                            style: TextStyle(
                                              color: ColorConstant.splashColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 30.sp,
                                            ),
                                          ),
                                          Text(
                                            controller
                                                    .resumeResponse
                                                    .value
                                                    ?.resumeData?[0]
                                                    .resumeAcademicHistories
                                                    ?.toDate ??
                                                "",
                                            style: TextStyle(
                                              color: ColorConstant.textColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 35.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 100.h,
                            ),
                            if (!controller.isPreview.value)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  height: 120.h,
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
                                        colors: const [
                                          Color(0xff3782F3),
                                          Color(0xff276ED8)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "APPLY NOW",
                                        style: TextStyle(
                                          color: ColorConstant.backgroundColor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily:
                                              TextFontFamily.openSansBold,
                                          fontSize: 35.sp,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (!controller.isPreview.value)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: GestureDetector(
                                  onTap: () {},
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
                                          fontFamily:
                                              TextFontFamily.openSansBold,
                                          fontSize: 32.sp,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: 300.h,
                              width: 300.h,
                              decoration: BoxDecoration(
                                color: ColorConstant.circleColor,
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Obx(
                                  () => (controller
                                                  .resumeResponse
                                                  .value
                                                  ?.resumeData?[0]
                                                  .resume
                                                  ?.url ??
                                              "") !=
                                          ""
                                      ? CachedNetworkImage(
                                          imageUrl: (controller
                                                  .resumeResponse
                                                  .value
                                                  ?.resumeData?[0]
                                                  .resume
                                                  ?.url ??
                                              ""),
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          AppUtils.getPNGAsset(
                                              ImageConstant.myProfileIcon),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "${(AppState.loginData?.user?.firstName ?? "").capitalize} ${(AppState.loginData?.user?.lastName ?? "").capitalize!}",
                              style: TextStyle(
                                color: ColorConstant.textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 52.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                            child: Text(
                              'UIUX Designer',
                              style: TextStyle(
                                color: ColorConstant.splashColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 30.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StackWidget extends StatelessWidget {
  String name;
  StackWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 104.h,
          width: 325,
          decoration: BoxDecoration(
            color: ColorConstant.blueColor.withOpacity(0.2),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
        ),
        Container(
          height: 104.h,
          width: 300,
          decoration: BoxDecoration(
            color: ColorConstant.blueColor.withOpacity(0.5),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
        ),
        Container(
          height: 104.h,
          width: 275,
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: ColorConstant.blueColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: TextStyle(
                color: ColorConstant.backgroundColor,
                fontWeight: FontWeight.w600,
                fontSize: 35.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
