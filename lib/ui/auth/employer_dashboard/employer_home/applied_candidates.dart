import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/applied_candidate_controller.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/employe_home_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/textfield_decoration.dart';
import 'package:triya_app/widgets/widget.dart';

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
            child: Center(
              child: Container(
                height: 115.h,
                width: 115.h,
                decoration: BoxDecoration(
                    color: ColorConstant.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffE9E9E9), width: 3)),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://s3-alpha-sig.figma.com/img/5387/ddcd/21388124e311307deee7a85f44bd1b8a?Expires=1648425600&Signature=PyYl48Eck5h8SBcMaDRIyCz-X9rzWs7zsRnfGTyb~zRq2SlR04gvUFTRLdOh48UBqO3j~gV2l55wZ-ZPjfQmLSi8eoh6Wq7D7JatJRFLeOSFfybCrZi~H8GljKEvJVeb-~oQ9FN3zOOPNzlCITqnLSyL8iRio8Ef7ULzfQUAHaDR-TqdbKhQU3HbCRVbQO1PDsvsodqF3WmQnhHGtq7oQxTFK1bgWbQX8-yJ901xP3rs2kKXbDKtL-LfBFepB~-l2zJ7W-KBmotXvAxKo5-AmrO5oNXD6PvymKsSGBcPdid9Y3FewHGVLj0z6IP5-28UBevK796~kI8EGqKNf-uZbw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                    height: 77.h,
                    width: 77.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          CommanTopBarField(
              widget: TextFormField(
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
          )),
          SizedBox(height: 60.h),
          Obx(
            () => ((controller.applyJob.value?.data?.privateJobs?.length ??
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
                              itemCount:
                                  controller.applyJob.value?.data?.id ?? 0,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
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
                                                    'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uJTIwd2l0aCUyMGdsYXNzZXN8ZW58MHx8MHx8&w=1000&q=80'),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(width: 32.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${controller.applyJob.value?.data?.privateJobs![index].firstName} ${controller.applyJob.value?.data?.privateJobs![index].lastName}",
                                              style: TextStyle(
                                                  fontFamily:
                                                      "OpenSans-Regular",
                                                  color: ColorConstant.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "",
                                              style: TextStyle(
                                                  fontFamily:
                                                      "OpenSans-Regular",
                                                  fontSize: 12,
                                                  color: Color(0xff3782F3),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {},
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
