import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/local_data/app_state.dart';
import 'package:triya_app/model/apply_job_response.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/applied_candidate_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';
import 'package:triya_app/widgets/textfield_decoration.dart';
import 'package:triya_app/widgets/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AppliedCandidateScreen extends StatelessWidget {
  AppliedCandidateScreen({Key? key}) : super(key: key);

  final controller = Get.put(AppliedCandidateController());

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
          'Applied Candidates',
          style: TextStyle(
              fontFamily: "OpenSans-Regular",
              color: ColorConstant.white,
              fontWeight: FontWeight.w700,
              fontSize: 52.sp),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: AppBarCircleAvtar(),
          )
        ],
      ),
      body: Column(
        children: [
          CommanTopBarField(
            widget: TextFormField(
              onChanged: (value) {
                controller.searchText.value = value;
                controller.searchText.refresh();
              },
              style: TextStyle(color: ColorConstant.backgroundColor),
              decoration: customInputDecoration(
                'Search for jobs here...',
                Color(0xff397ADB),
                Color(0xff397ADB),
                prefixIcon: SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Center(
                    child: SvgPicture.asset(
                      AppUtils.getSVGAsset(ImageConstant.search_icon),
                      height: 40.h,
                      width: 40.w,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 60.h),
          Obx(
            () => ((controller.applyJob.value?.data?.privateJobs
                                ?.where(((element) => (element.firstName ?? "")
                                    .toLowerCase()
                                    .contains(controller.searchText.value
                                        .toLowerCase())))
                                .length ??
                            0) ==
                        null &&
                    controller.loading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ((controller.applyJob.value?.data?.privateJobs?.length ??
                            0) ==
                        0)
                    ? Center(
                        child: Text("No Data Found"),
                      )
                    : Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: ListView.builder(
                              itemCount: controller
                                      .applyJob.value?.data?.privateJobs
                                      ?.where(((element) =>
                                          (element.firstName ?? "")
                                              .toLowerCase()
                                              .contains(controller
                                                  .searchText.value
                                                  .toLowerCase())))
                                      .length ??
                                  0,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                PrivateJobs data = (controller
                                    .applyJob.value?.data?.privateJobs
                                    ?.where(((element) => (element.firstName ??
                                            "")
                                        .toLowerCase()
                                        .contains(controller.searchText.value
                                            .toLowerCase())))
                                    .toList()[index])!;
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 24.h),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Color(0xffEEF5FF),
                                        borderRadius:
                                            BorderRadius.circular(88.r)),
                                    child: Padding(
                                      padding: EdgeInsets.all(22.r),
                                      child: Row(children: [
                                        Container(
                                          height: 91.h,
                                          width: 91.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                '${data.profilePicture}',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 32.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${data.firstName ?? ""} ${data.lastName ?? ""}",
                                              style: TextStyle(
                                                fontFamily: "OpenSans-Regular",
                                                color: ColorConstant.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            /*Text(
                                              "",
                                              // "${controller.applyJob.value?.data?.privateJobs![index].}",
                                              style: TextStyle(
                                                  fontFamily:
                                                      "OpenSans-Regular",
                                                  fontSize: 12,
                                                  color: Color(0xff3782F3),
                                                  fontWeight: FontWeight.w600),
                                            ),*/
                                          ],
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            if (data.upload != null) {
                                              AppState.downloadFile(
                                                  data.upload ?? "");
                                            } else {
                                              data.userId;
                                              Get.toNamed(
                                                  NavigationName
                                                      .privateResumeApplyPage,
                                                  arguments: {
                                                    AppConstants.isPreview:
                                                        true,
                                                    AppConstants.userId:
                                                        data.userId
                                                  });
                                            }
                                          },
                                          child: Container(
                                            height: 91.h,
                                            width: 91.w,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff3782F3)),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.download_rounded,
                                              size: 18,
                                              color: Color(0xff3782F3),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}
