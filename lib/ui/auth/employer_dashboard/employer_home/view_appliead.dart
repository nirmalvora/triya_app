import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/local_data/app_state.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/add_new_job.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/employe_home_controller.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/posted_job_detail_controller.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewApplieadScreen extends StatelessWidget {
  ViewApplieadScreen({Key? key}) : super(key: key);

  final controller = Get.put(PostedJobDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.splashColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: Center(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  height: 115.h,
                  width: 115.h,
                  decoration: BoxDecoration(
                      color: Color(0xff2A70DA), shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 50.r,
                  )),
            ),
          ),
        ),
        title: Text(
          'My Jobs',
          style: TextStyle(
              fontFamily: "OpenSans-Regular",
              color: ColorConstant.white,
              fontWeight: FontWeight.w700,
              fontSize: 52.sp),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.w, bottom: 10.h),
            child: AppBarCircleAvtar(),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.postedJob.value?.jobTitle ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.black,
                          fontSize: 52.sp,
                          fontFamily: "OpenSans-Regular"),
                    ),
                    SizedBox(height: 30.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(19.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 35.w),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Post Date:',
                                        style: TextStyle(
                                          color: Color(0xff676767),
                                          fontSize: 12,
                                          fontFamily: "OpenSans-Regular",
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        controller.postedJob.value?.fromDate ??
                                            "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: "OpenSans-Regular"),
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(width: 30.w),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(19.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 35.w),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Last Date:',
                                        style: TextStyle(
                                          color: Color(0xff676767),
                                          fontSize: 12,
                                          fontFamily: "OpenSans-Regular",
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        controller.postedJob.value?.toDate ??
                                            "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: "OpenSans-Regular"),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 28.h),
                        CommanViewAppliedContainer(
                          maxLine: 1,
                          title: 'Qualification',
                          subtitle:
                              controller.postedJob.value?.qualification ?? "",
                        ),
                        SizedBox(height: 28.h),
                        CommanViewAppliedContainer(
                          maxLine: 1,
                          title: 'Job Link',
                          subtitle: controller.postedJob.value?.jobLink ?? "",
                        ),
                        SizedBox(height: 28.h),
                        CommanViewAppliedContainer(
                          maxLine: 3,
                          title: 'Job Details:',
                          subtitle: controller.postedJob.value?.jobDetail ?? "",
                        ),
                        SizedBox(height: 28.h),
                        CommanViewAppliedContainer(
                          maxLine: 3,
                          title: 'Job Category:',
                          subtitle: 'Selected',
                        ),
                        SizedBox(height: 50.h),
                        InkWell(
                          onTap: () async {
                            AppState.downloadFile(
                                '${controller.postedJob.value?.upload}');
                            /* if (await canLaunch(
                                controller.postedJob.value?.upload ?? '')) {
                              await launch(
                                  controller.postedJob.value?.upload ?? '');
                            } else {
                              throw 'Could not launch "${controller.postedJob.value?.upload ?? ''}"';
                            }*/
                          },
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Text(
                              'Download Pdf',
                              style: TextStyle(
                                  color: Color(0xff286FD9),
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "OpenSans-Regular"),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.download_rounded,
                              color: Color(0xff286FD9),
                              size: 18,
                            ),
                          ]),
                        ),
                        SizedBox(height: 180.h),
                        CommanButton(
                            onTap: () {
                              Get.toNamed(NavigationName.appliedCandidates,
                                  arguments: {
                                    AppConstants.jobID:
                                        controller.postedJob.value!.id
                                  });
                              print(
                                  'sagar devani ${controller.postedJob.value!.id}');
                            },
                            text: 'View Applied Candidates'),
                        SizedBox(
                            height: MediaQuery.of(context).padding.bottom + 20),
                      ],
                    )
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

class CommanViewAppliedContainer extends StatelessWidget {
  String title;
  String subtitle;
  int maxLine;
  CommanViewAppliedContainer(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.maxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffF6F6F6), borderRadius: BorderRadius.circular(19.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 35.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xff676767),
              fontSize: 12,
              fontFamily: "OpenSans-Regular",
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            maxLines: maxLine,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: "OpenSans-Regular"),
          ),
        ]),
      ),
    );
  }
}
