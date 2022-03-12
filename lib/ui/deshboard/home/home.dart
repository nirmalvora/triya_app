import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/utils/app_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: ColorConstant.backgroundColor,
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        backgroundColor: ColorConstant.backgroundColor,
        child: Column(
          children: [
            Container(
              height: 317.h,
              color: ColorConstant.splashColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppUtils.getSVGAsset(ImageConstant.homeIcon),
                        height: 45.h,
                        width: 51.h,
                      ),
                      SizedBox(
                        width: 25.h,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 45.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 96.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppUtils.getSVGAsset(ImageConstant.profileIcon),
                        height: 45.h,
                        width: 51.h,
                      ),
                      SizedBox(
                        width: 25.h,
                      ),
                      Text(
                        'My Account',
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 45.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 96.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppUtils.getSVGAsset(ImageConstant.lobsIcon),
                        height: 45.h,
                        width: 51.h,
                      ),
                      SizedBox(
                        width: 25.h,
                      ),
                      Text(
                        'Applied Lobs',
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 45.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 96.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppUtils.getPNGAsset(ImageConstant.favoritesIcon),
                        height: 45.h,
                        width: 51.h,
                      ),
                      SizedBox(
                        width: 25.h,
                      ),
                      Text(
                        'My Favorites',
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 45.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 96.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppUtils.getPNGAsset(ImageConstant.favoritesIcon),
                        height: 45.h,
                        width: 51.h,
                      ),
                      SizedBox(
                        width: 25.h,
                      ),
                      Text(
                        'Favorites Books',
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 45.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 96.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppUtils.getPNGAsset(ImageConstant.favoritesIcon),
                        height: 45.h,
                        width: 51.h,
                      ),
                      SizedBox(
                        width: 25.h,
                      ),
                      Text(
                        'Favorites Video',
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 45.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 96.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(NavigationName.resumePage);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          AppUtils.getPNGAsset(ImageConstant.favoritesIcon),
                          height: 45.h,
                          width: 51.h,
                        ),
                        SizedBox(
                          width: 25.h,
                        ),
                        Text(
                          'My Resume',
                          style: TextStyle(
                            color: ColorConstant.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 45.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () => _key.currentState!.openDrawer(),
            child: CircleAvatar(
              backgroundColor: ColorConstant.droverButtonColor,
              radius: 18,
              child: SvgPicture.asset(
                AppUtils.getSVGAsset(ImageConstant.drawerIcon),
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppUtils.getPNGAsset(ImageConstant.appLogoIcon),
              height: 35,
            ),
            Text(
              'Triya',
              style: TextStyle(
                color: ColorConstant.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 45.sp,
              ),
            ),
          ],
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
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppUtils.getPNGAsset(ImageConstant.bannerIcon),
                height: 341.h,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Discover Jobs',
                style: TextStyle(
                  color: ColorConstant.textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 72.sp,
                ),
              ),
              SizedBox(
                height: 33.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(NavigationName.govJobPage);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        height: 350.h,
                        width: 279.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.h),
                          gradient: LinearGradient(
                            colors: const [
                              Color(0xffDFECFE),
                              Color(0xffFFFFFF)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Spacer(),
                              Container(
                                height: 166.h,
                                width: 166.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(43.h),
                                  gradient: LinearGradient(
                                    colors: const [
                                      Color(0xffDFECFE),
                                      Color(0xffFFFFFF)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(39, 110, 216, 0.08),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  AppUtils.getPNGAsset(ImageConstant.govIcon),
                                  height: 74.h,
                                  width: 74.h,
                                ),
                              ),
                              SizedBox(
                                height: 66.h,
                              ),
                              Text(
                                'Government Jobs',
                                style: TextStyle(
                                  color: ColorConstant.textColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      height: 350.h,
                      width: 279.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.h),
                        gradient: LinearGradient(
                          colors: const [Color(0xffDFF8FE), Color(0xffffffff)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              height: 166.h,
                              width: 166.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(43.h),
                                gradient: LinearGradient(
                                  colors: const [
                                    Color(0xffDFF8FE),
                                    Color(0xffFFFFFF)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(39, 110, 216, 0.08),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                AppUtils.getPNGAsset(ImageConstant.privateIcon),
                                height: 74.h,
                                width: 74.h,
                              ),
                            ),
                            SizedBox(
                              height: 66.h,
                            ),
                            Text(
                              'Private Jobs',
                              style: TextStyle(
                                color: ColorConstant.textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 25.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      height: 350.h,
                      width: 278.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.h),
                        gradient: LinearGradient(
                          colors: const [Color(0xffFEF2DF), Color(0xffFFFFFF)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              height: 166.h,
                              width: 166.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(43.h),
                                gradient: LinearGradient(
                                  colors: const [
                                    Color(0xffFEF2DF),
                                    Color(0xffFFFFFF)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(39, 110, 216, 0.08),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                AppUtils.getPNGAsset(
                                    ImageConstant.scholarshipIcon),
                                height: 74.h,
                                width: 74.h,
                              ),
                            ),
                            SizedBox(
                              height: 66.h,
                            ),
                            Text(
                              'Scholarship Jobs',
                              style: TextStyle(
                                color: ColorConstant.textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 25.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 118.h,
                width: 615.h,
                decoration: BoxDecoration(
                  color: Color(0xff3782F3),
                  borderRadius: BorderRadius.circular(19.h),
                ),
                child: Center(
                  child: Text(
                    'Create Your Resume',
                    style: TextStyle(
                      color: ColorConstant.backgroundColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: TextFontFamily.openSansBold,
                      fontSize: 32.sp,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 122.h,
              ),
              Text(
                'Which Is Your Best Skill?',
                style: TextStyle(
                  color: ColorConstant.textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 45.sp,
                ),
              ),
              SizedBox(
                height: 34.h,
              ),
              Row(
                children: [
                  Container(
                    height: 113.h,
                    width: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(34.h),
                      border: Border.all(
                        color: Color(0xffDADADA),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'C++',
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: TextFontFamily.openSensRegular,
                          fontSize: 30.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 35.h,
                  ),
                  Container(
                    height: 113.h,
                    width: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(34.h),
                      border: Border.all(
                        color: Color(0xffDADADA),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'JAVA',
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: TextFontFamily.openSensRegular,
                          fontSize: 30.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 35.h,
                  ),
                  Container(
                    height: 113.h,
                    width: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(34.h),
                      border: Border.all(
                        color: Color(0xffDADADA),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'UNIX',
                        style: TextStyle(
                          color: ColorConstant.textColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: TextFontFamily.openSensRegular,
                          fontSize: 30.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 31.h,
              ),
              Container(
                height: 113.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34.h),
                  color: Color(0xffF8F8F8),
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Container(
                height: 113.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34.h),
                  color: Color(0xffF8F8F8),
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Container(
                height: 113.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34.h),
                  color: Color(0xffF8F8F8),
                ),
              ),
              SizedBox(
                height: 122.h,
              ),
              Image.asset(
                AppUtils.getPNGAsset(ImageConstant.bannerIcon),
                height: 341.h,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Books',
                    style: TextStyle(
                      color: ColorConstant.textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 72.sp,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(NavigationName.bookPage);
                    },
                    child: Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            color: ColorConstant.splashColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: ColorConstant.splashColor,
                          radius: 14,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: ColorConstant.backgroundColor,
                            size: 14,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 107.h,
              ),
              Row(
                children: [
                  Text(
                    'Videos',
                    style: TextStyle(
                      color: ColorConstant.textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 72.sp,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(NavigationName.videoPage);
                    },
                    child: Row(
                      children: [
                        Text(
                          'See More',
                          style: TextStyle(
                            color: ColorConstant.splashColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: ColorConstant.splashColor,
                          radius: 14,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: ColorConstant.backgroundColor,
                            size: 14,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
