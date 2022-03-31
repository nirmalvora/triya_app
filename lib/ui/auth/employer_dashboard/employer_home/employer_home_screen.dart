import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/model/private_job_response_model.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/preference/prerences.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/employe_home_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';
import 'package:triya_app/widgets/textfield_decoration.dart';
import 'package:triya_app/widgets/widget.dart';

class EmployerHomeScreen extends StatefulWidget {
  EmployerHomeScreen({Key? key}) : super(key: key);

  @override
  State<EmployerHomeScreen> createState() => _EmployerHomeScreenState();
}

class _EmployerHomeScreenState extends State<EmployerHomeScreen> {
  final controller = Get.put(EmployerHomeController());
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      backgroundColor: ColorConstant.white,
      drawer: Drawer(
        backgroundColor: ColorConstant.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(46.h),
            topRight: Radius.circular(46.h),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 390.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(46.h),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    AppUtils.getPNGAsset(ImageConstant.drawerImage),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 35, right: 15, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Stack(
                          overflow: Overflow.visible,
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorConstant.backgroundColor
                                  .withOpacity(0.1),
                              radius: 24,
                            ),
                            CircleAvatar(
                              backgroundColor: ColorConstant.backgroundColor
                                  .withOpacity(0.1),
                              radius: 18,
                              child: Icon(Icons.arrow_back,
                                  color: ColorConstant.backgroundColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: InkWell(
                onTap: () {
                  Get.offAllNamed(NavigationName.loginTypePage);
                  Preferences.clear();
                },
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 62.w),
                    SizedBox(width: 25.w),
                    Text(
                      'Logout',
                      style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 45.sp),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.splashColor,
        leading: GestureDetector(
          onTap: () => controller.key.currentState!.openDrawer(),
          /*onTap: () {
            // Get.offAllNamed(NavigationName.loginTypePage);
            Preferences.clear();
          },*/
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: SvgPicture.asset(
              AppUtils.getSVGAsset(ImageConstant.appbar_icon),
              height: 115.h,
              width: 115.h,
            ),
          )),
        ),
        title: Text(
          'My Jobs',
          style: TextStyle(
              fontFamily: "OpenSans-Regular",
              color: ColorConstant.white,
              fontWeight: FontWeight.w700,
              fontSize: 52.sp),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: AppBarCircleAvtar(),
          )
        ],
      ),
      body: Column(
        children: [
          CommanTopBarField(
            widget: TextFormField(
              style: TextStyle(color: ColorConstant.white),
              onChanged: (value) {
                controller.searchText.value = value;
                controller.searchText.refresh();
              },
              decoration: customInputDecoration(
                'Search for jobs here...',
                Color(0xff397ADB),
                Color(0xff397ADB),
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
              ),
            ),
          ),
          SizedBox(height: 49.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Posted Jobs',
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
          Obx(
            () => SizedBox(
              height: 100.h,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount:
                    controller.postedJobResponse.value?.data?.length ?? 0,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: selected == index
                              ? ColorConstant.blueColor
                              : ColorConstant.backgroundColor,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              controller.postedJobResponse.value?.data?[index]
                                      .name ??
                                  "",
                              style: TextStyle(
                                color: selected == index
                                    ? ColorConstant.backgroundColor
                                    : ColorConstant.textColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: TextFontFamily.openSansBold,
                                fontSize: 32.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 50.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Obx(
                () => ((controller.postedJobResponse.value?.data?[selected]
                                        .employee
                                        ?.where(((element) => (element.jobTitle!
                                                .toLowerCase()
                                                .contains(controller
                                                    .searchText.value
                                                    .toLowerCase()) ||
                                            (element.city ?? "")
                                                .toLowerCase()
                                                .contains(controller
                                                    .searchText.value
                                                    .toLowerCase()))))
                                        .toList()
                                        .length ??
                                    0) ==
                                0) ==
                            null &&
                        controller.loading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ((controller.postedJobResponse.value?.data?.length ??
                                0) ==
                            0)
                        ? Center(
                            child: Text("No Data Found"),
                          )
                        : ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.postedJobResponse.value
                                    ?.data?[selected].employee
                                    ?.where(((element) => (element.jobTitle!
                                            .toLowerCase()
                                            .contains(controller
                                                .searchText.value
                                                .toLowerCase()) ||
                                        (element.city ?? "")
                                            .toLowerCase()
                                            .contains(controller
                                                .searchText.value
                                                .toLowerCase()))))
                                    .toList()
                                    .length ??
                                0,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              PostedJob data = (controller.postedJobResponse
                                  .value?.data?[selected].employee
                                  ?.where(((element) => (element.jobTitle!
                                          .toLowerCase()
                                          .contains(controller.searchText.value
                                              .toLowerCase()) ||
                                      (element.city ?? "")
                                          .toLowerCase()
                                          .contains(controller.searchText.value
                                              .toLowerCase()))))
                                  .toList())![index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 30.h),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(NavigationName.viewAppliead,
                                        arguments: {"get-job-post": data});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color(0xffF1F1F1)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 34.w, top: 26.h, bottom: 26.h),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                data.jobTitle ?? '',
                                                // 'Staff Car Driver(Ordinary Grade de) - 24 post',
                                                maxLines: 2,
                                                style: TextStyle(
                                                  color:
                                                      ColorConstant.textColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 30.sp,
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              Text(
                                                '24 People Applied - ${data.city}',
                                                style: TextStyle(
                                                  color: ColorConstant.black,
                                                  fontSize: 25.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 24.w),
                                            height: 100.h,
                                            width: 100.h,
                                            decoration: BoxDecoration(
                                              color: Color(0xffE6E6E6),
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                            ),
                                            child: Icon(
                                              Icons
                                                  .keyboard_arrow_right_outlined,
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
            ),
          )
        ],
      ),
    );
  }
}
