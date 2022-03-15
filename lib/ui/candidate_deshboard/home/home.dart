import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/home_controller.dart';
import 'package:triya_app/utils/app_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int selected = 0;
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: ColorConstant.backgroundColor,
      drawerEnableOpenDragGesture: false,
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
                padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundImage: AssetImage(
                              AppUtils.getPNGAsset(ImageConstant.myProfileIcon),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Danny Joseph',
                                style: TextStyle(
                                  color: ColorConstant.backgroundColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: TextFontFamily.openSansBold,
                                  fontSize: 40.sp,
                                ),
                              ),
                              Text(
                                'Danny Joseph',
                                style: TextStyle(
                                  color: ColorConstant.backgroundColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                        width: 51.w,
                      ),
                      SizedBox(
                        width: 25.w,
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
                        width: 51.w,
                      ),
                      SizedBox(
                        width: 25.w,
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
                        width: 51.w,
                      ),
                      SizedBox(
                        width: 25.w,
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
                        height: 62.h,
                        width: 62.w,
                      ),
                      SizedBox(
                        width: 25.w,
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
                        height: 62.h,
                        width: 62.w,
                      ),
                      SizedBox(
                        width: 25.w,
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
                        height: 62.h,
                        width: 62.w,
                      ),
                      SizedBox(
                        width: 25.w,
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
                          height: 62.h,
                          width: 62.w,
                        ),
                        SizedBox(
                          width: 25.w,
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                  itemCount:
                      controller.topBannerResponse.value?.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(31.r),
                        image: DecorationImage(
                            image: NetworkImage(controller.topBannerResponse
                                    .value?.data?[itemIndex].image ??
                                ""),
                            fit: BoxFit.cover)),
                  ),
                  options: CarouselOptions(
                    height: 341.h,
                    initialPage: 1,
                    viewportFraction: 0.9,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 1),
                  ),
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
                    _buildOption(
                        'Government Jobs',
                        ImageConstant.govIcon,
                        [Color(0xffDFECFE), Color(0xffFFFFFF)],
                        [Color(0xffDFECFE), Color(0xffFFFFFF)],
                        Color(0xff276ED8), () {
                      Get.toNamed(NavigationName.govJobPage);
                    }),
                    _buildOption(
                        'Private Jobs',
                        ImageConstant.privateIcon,
                        [Color(0xffDFF8FE), Color(0xffffffff)],
                        [Color(0xffDFF8FE), Color(0xffFFFFFF)],
                        Color(0xff04B25F), () {
                      Get.toNamed(NavigationName.privateJobPage);
                    }),
                    _buildOption(
                        'Scholarship Jobs',
                        ImageConstant.scholarshipIcon,
                        [Color(0xffFEF2DF), Color(0xffFFFFFF)],
                        [Color(0xffFEF2DF), Color(0xffFFFFFF)],
                        Color(0xffCE8517), () {
                      Get.toNamed(NavigationName.scholarshipJobPage);
                    }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(NavigationName.resumePage);
                  },
                  child: Container(
                    height: 120.h,
                    width: 615.h,
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
                            child: Text(
                              'Create Your Resume',
                              style: TextStyle(
                                color: ColorConstant.backgroundColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: TextFontFamily.openSansBold,
                                fontSize: 40.sp,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ],
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
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          selected = 0;
                        },
                        child: Container(
                          height: 113.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34.h),
                            border: Border.all(
                              color: selected == 0
                                  ? ColorConstant.borderColor
                                  : Color(0xffDADADA),
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
                      ),
                    ),
                    SizedBox(
                      width: 35.h,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          selected = 1;
                        },
                        child: Container(
                          height: 113.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34.h),
                            border: Border.all(
                              color: selected == 1
                                  ? ColorConstant.borderColor
                                  : Color(0xffDADADA),
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
                      ),
                    ),
                    SizedBox(
                      width: 35.h,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          selected = 2;
                        },
                        child: Container(
                          height: 113.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34.h),
                            border: Border.all(
                              color: selected == 2
                                  ? ColorConstant.borderColor
                                  : Color(0xffDADADA),
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
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 31.h,
                ),
                Stack(
                  children: [
                    Container(
                      height: 113.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34.h),
                        color: Color(0xffF8F8F8),
                      ),
                    ),
                    Container(
                      height: 113.h,
                      width: 290,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(34.h),
                          bottomLeft: Radius.circular(34.h),
                        ),
                        gradient: LinearGradient(
                          colors: [Color(0xffE2E2E2), Color(0xfff1f1f1)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppUtils.getSVGAsset(ImageConstant.selectedIcon),
                              height: 25,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'C++',
                              style: TextStyle(
                                color: ColorConstant.text1Color,
                                fontWeight: FontWeight.w700,
                                fontFamily: TextFontFamily.openSansBold,
                                fontSize: 30.sp,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '85%',
                              style: TextStyle(
                                color: ColorConstant.text1Color,
                                fontWeight: FontWeight.w700,
                                fontFamily: TextFontFamily.openSansBold,
                                fontSize: 30.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9.h,
                ),
                Stack(
                  children: [
                    Container(
                      height: 113.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34.h),
                        color: Color(0xffF8F8F8),
                      ),
                    ),
                    Container(
                      height: 113.h,
                      width: 290,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(34.h),
                          bottomLeft: Radius.circular(34.h),
                        ),
                        gradient: LinearGradient(
                          colors: [Color(0xffE2E2E2), Color(0xfff1f1f1)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppUtils.getSVGAsset(ImageConstant.selectedIcon),
                              height: 25,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'C++',
                              style: TextStyle(
                                color: ColorConstant.text1Color,
                                fontWeight: FontWeight.w700,
                                fontFamily: TextFontFamily.openSansBold,
                                fontSize: 30.sp,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '85%',
                              style: TextStyle(
                                color: ColorConstant.text1Color,
                                fontWeight: FontWeight.w700,
                                fontFamily: TextFontFamily.openSansBold,
                                fontSize: 30.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9.h,
                ),
                Stack(
                  children: [
                    Container(
                      height: 113.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34.h),
                        color: Color(0xffF8F8F8),
                      ),
                    ),
                    Container(
                      height: 113.h,
                      width: 290,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(34.h),
                          bottomLeft: Radius.circular(34.h),
                        ),
                        gradient: LinearGradient(
                          colors: [Color(0xffE2E2E2), Color(0xfff1f1f1)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppUtils.getSVGAsset(ImageConstant.selectedIcon),
                              height: 25,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'C++',
                              style: TextStyle(
                                color: ColorConstant.text1Color,
                                fontWeight: FontWeight.w700,
                                fontFamily: TextFontFamily.openSansBold,
                                fontSize: 30.sp,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '85%',
                              style: TextStyle(
                                color: ColorConstant.text1Color,
                                fontWeight: FontWeight.w700,
                                fontFamily: TextFontFamily.openSansBold,
                                fontSize: 30.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 122.h,
                ),
                CarouselSlider.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(31.r),
                        image: DecorationImage(
                            image: NetworkImage(
                                'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  options: CarouselOptions(
                    height: 341.h,
                    initialPage: 1,
                    viewportFraction: 0.9,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 1),
                  ),
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
                  height: 30.h,
                ),
                SizedBox(
                  height: 400.h,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10, top: 30),
                        child: SizedBox(
                          width: 432.h,
                          child: Stack(
                            overflow: Overflow.visible,
                            children: [
                              Container(
                                height: 317.h,
                                width: 432.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.h),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xffEFEFEF).withOpacity(0),
                                      Color(0xffEFEFEF),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      'Environmental Science',
                                      style: TextStyle(
                                        color: ColorConstant.textColor,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: TextFontFamily.openSansBold,
                                        fontSize: 30.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                right: 15,
                                top: -30,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.h),
                                  child: Image.asset(
                                      AppUtils.getPNGAsset(
                                          ImageConstant.bannerIcon),
                                      height: 300.h,
                                      width: 370.h,
                                      fit: BoxFit.cover),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
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
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  height: 400.h,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10, top: 50),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 317.h,
                              width: 432.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.h),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffEFEFEF).withOpacity(0),
                                    Color(0xffEFEFEF),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Autos & Vehicles',
                                    style: TextStyle(
                                      color: ColorConstant.textColor,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: TextFontFamily.openSansBold,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 15,
                              right: 15,
                              top: -50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.h),
                                child: Image.asset(
                                    AppUtils.getPNGAsset(
                                        ImageConstant.bannerIcon),
                                    height: 300.h,
                                    width: 370.h,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildOption(
      String text, String image, mainGradient, insideGradient, shadow, onTap) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 18),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 350.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.h),
              gradient: LinearGradient(
                colors: mainGradient,
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
                        colors: insideGradient,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 18.h),
                          blurRadius: 10,
                          color: shadow.withOpacity(0.08),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        AppUtils.getPNGAsset(image),
                        height: 74.h,
                        width: 74.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 66.h,
                  ),
                  Text(
                    text,
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
    );
  }
}
