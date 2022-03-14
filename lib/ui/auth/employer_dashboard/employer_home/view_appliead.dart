import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/add_new_job.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/employer_home_screen.dart';
import 'package:triya_app/utils/app_utils.dart';

class ViewApplieadScreen extends StatelessWidget {
  const ViewApplieadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.splashColor,
        leading: Center(
            child: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: SvgPicture.asset(
            AppUtils.getSVGAsset(ImageConstant.appbar_icon),
            height: 115.h,
            width: 115.h,
          ),
        )),
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
            padding: EdgeInsets.only(right: 30.w),
            child: ClipOval(
              child: Container(
                height: 115.h,
                width: 115.h,
                decoration: BoxDecoration(
                    color: ColorConstant.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffE9E9E9), width: 3)),
                child: ClipOval(
                  child: Image.network(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommanTopBarField(),
          SizedBox(height: 60.h),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UIUX Designer 2year Exp.',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.black,
                          fontSize: 52.sp,
                          fontFamily: "OpenSans-Regular"),
                    ),
                    SizedBox(height: 7.h),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff3782F3),
                          borderRadius: BorderRadius.circular(74.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 27.h, vertical: 11.h),
                        child: Text(
                          '24 People Applied',
                          style: TextStyle(
                              color: ColorConstant.white,
                              fontSize: 12,
                              fontFamily: "OpenSans-Regular"),
                        ),
                      ),
                    ),
                    SizedBox(height: 44.h),
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
                                        '24th Dec, 2020',
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
                                        '01st Jan, 2021',
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
                          title: 'Qualification:',
                          subtitle: 'Matriculation with valid driving liscence',
                        ),
                        SizedBox(height: 28.h),
                        CommanViewAppliedContainer(
                          maxLine: 1,
                          title: 'Company Name:',
                          subtitle: 'Tech Mahindra',
                        ),
                        SizedBox(height: 28.h),
                        CommanViewAppliedContainer(
                          maxLine: 1,
                          title: 'Job Link',
                          subtitle:
                              'https://www.naukri.com/job-listings-graphic-designe',
                        ),
                        SizedBox(height: 28.h),
                        CommanViewAppliedContainer(
                          maxLine: 3,
                          title: 'Job Details:',
                          subtitle:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet condimentum ullamcorper amet tristique et enim mauris. Laoreet curabitur maecenas elit enim sed. ',
                        ),
                        SizedBox(height: 50.h),
                        InkWell(
                          onTap: () {},
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
                              Get.toNamed(NavigationName.appliedCandidates);
                            },
                            text: 'View Appliead Candidates'),
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
