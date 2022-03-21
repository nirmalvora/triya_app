import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/professional_resume_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/cache_imageview.dart';
import 'package:triya_app/widgets/common_container.dart';

class ProfessionalResumeScreen extends StatelessWidget {
  ProfessionalResumeScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProfileResumeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: 600.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppUtils.getPNGAsset(ImageConstant.backResumeImage),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 30),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: CircleAvatar(
                                backgroundColor: ColorConstant.droverButtonColor
                                    .withOpacity(0.1),
                                radius: 18,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: ColorConstant.backgroundColor,
                                ),
                              ),
                            ),
                            Text(
                              'PROFESSIONAL RESUME',
                              style: TextStyle(
                                color: ColorConstant.backgroundColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: TextFontFamily.openSansBold,
                                fontSize: 32.sp,
                                letterSpacing: 2,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -55,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          controller.getImage();
                        },
                        child: CircleAvatar(
                          backgroundColor: ColorConstant.backgroundColor,
                          radius: 55,
                          child: ClipOval(
                            child: Obx(
                              () => controller.image.value == null
                                  ? ((controller.resumeResponse.value
                                                      ?.resumeData?.length ??
                                                  0) !=
                                              0) &&
                                          (controller
                                                      .resumeResponse
                                                      .value
                                                      ?.resumeData?[0]
                                                      .resume
                                                      ?.url ??
                                                  "") !=
                                              ""
                                      ? CacheImageView(
                                          imageUrl: controller
                                                  .resumeResponse
                                                  .value
                                                  ?.resumeData![0]
                                                  .resume
                                                  ?.url ??
                                              "")
                                      : Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCubUN2VDqYNO0nfbwpiJmiHwmkXyux32Izw&usqp=CAU",
                                          fit: BoxFit.cover,
                                          height: double.infinity,
                                          width: double.infinity,
                                        )
                                  : Image.file(
                                      controller.image.value!,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.personalPage);
                },
                child: CommonContainer(
                  name: "PERSONAL STATEMENT",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.contactPage);
                },
                child: CommonContainer(
                  name: "CONTACT INFORMATION",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.professionalPage);
                },
                child: CommonContainer(
                  name: "PROFESSIONAL EXPERIENCE",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.academicPage);
                },
                child: CommonContainer(
                  name: "ACADEMIC HISTORY",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.keySkillsPage);
                },
                child: CommonContainer(
                  name: "KEY SKILLS",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.industryAwards);
                },
                child: CommonContainer(
                  name: "INDUSTRY AWARDS",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.professionalCertifications);
                },
                child: CommonContainer(
                  name: "PROFESSIONAL CERTIFICATES",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.publication);
                },
                child: CommonContainer(
                  name: "PUBLICATION",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.professiocal_Affiliation);
                },
                child: CommonContainer(
                  name: "PROFESSIONAL AFFILIATIONS",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.conference_Attended);
                },
                child: CommonContainer(
                  name: "CONFERENCE ATTENDED",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationName.additional_Training);
                },
                child: CommonContainer(
                  name: "ADDITIONAL TRAINS",
                ),
              ),
              SizedBox(height: 20),
              /*   Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        colors: const [Color(0xff3782F3), Color(0xff276ED8)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                          color: ColorConstant.backgroundColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: TextFontFamily.openSansBold,
                          fontSize: 35.sp,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    if ((controller.resumeResponse.value?.resumeData?.length ??
                            0) !=
                        0) {
                      Get.toNamed(NavigationName.privateResumeApplyPage,
                          arguments: {AppConstants.isPreview: true});
                    } else {
                      Get.snackbar('Please fillup resume data', '');
                    }
                  },
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
                          colors: const [Color(0xff3782F3), Color(0xff276ED8)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "PREVIEW",
                          style: TextStyle(
                            color: ColorConstant.backgroundColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: TextFontFamily.openSansBold,
                            fontSize: 35.sp,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Obx(
                () => controller.showApplyButton.value
                    ? Padding(
                        padding: const EdgeInsets.only(
                            right: 15, left: 15, bottom: 30, top: 10),
                        child: GestureDetector(
                          onTap: () {
                            if ((controller.resumeResponse.value?.resumeData
                                        ?.length ??
                                    0) !=
                                0) {
                              controller.applyJob();
                            } else {
                              Get.snackbar('Please fillup resume data', '');
                            }
                          },
                          child: Container(
                            height: 120.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstant.buttonColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Center(
                                    child: Text(
                                      'Apply job',
                                      style: TextStyle(
                                        color: ColorConstant.splashColor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: TextFontFamily.openSansBold,
                                        fontSize: 40.sp,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
