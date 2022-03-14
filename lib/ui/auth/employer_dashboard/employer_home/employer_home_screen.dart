import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/utils/app_utils.dart';

class EmployerHomeScreen extends StatelessWidget {
  const EmployerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
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
        children: [
          CommanTopBarField(),
          SizedBox(height: 49.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Posted 10 Jobs',
                  style: TextStyle(
                      fontSize: 52.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "OpenSans-Regular"),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(NavigationName.addNewJob);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: const [
                              Color(0xff3782F3),
                              Color(0xff276ED8)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.circular(84.r)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 17.w, left: 29.w, top: 17.h, bottom: 17.h),
                      child: Row(
                        children: [
                          Text(
                            'Add a new job',
                            style: TextStyle(
                                fontFamily: "OpenSans-Regular",
                                color: ColorConstant.white,
                                fontSize: 12),
                          ),
                          SizedBox(width: 20.w),
                          CircleAvatar(
                            minRadius: 40.r,
                            backgroundColor: ColorConstant.white,
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: Color(0xff3782F3),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 50.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 8,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(NavigationName.viewAppliead);
                      },
                      child: Container(
                        height: 140.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffF1F1F1)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 34.w, top: 26.h, bottom: 26.h),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Staff Car Driver(Ordinary Grade de) - 24 post',
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: ColorConstant.textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '24 People Applied',
                                    style: TextStyle(
                                      color: ColorConstant.black,
                                      fontSize: 25.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                height: 100.h,
                                width: 100.h,
                                decoration: BoxDecoration(
                                  color: Color(0xffE6E6E6),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: Color(0xff9F9F9F),
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CommanTopBarField extends StatelessWidget {
  const CommanTopBarField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstant.splashColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(34.r),
              bottomRight: Radius.circular(34.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: TextFormField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              fillColor: Color(0xff397ADB),
              filled: true,
              hintText: 'Search for jobs here...',
              hintStyle: TextStyle(
                  color: ColorConstant.white,
                  fontSize: 12,
                  fontFamily: "OpenSans-Regular"),
              prefixIcon: Container(
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
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: Color(0xff397ADB))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: Color(0xff397ADB)))),
        ),
      ),
    );
  }
}
