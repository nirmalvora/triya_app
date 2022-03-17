import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/local_data/app_state.dart';
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

  final controller = Get.put(HomeController());
  var percentValue = 0.6;

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
                                AppState.loginData?.user?.firstName ?? "",
                                style: TextStyle(
                                  color: ColorConstant.backgroundColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: TextFontFamily.openSansBold,
                                  fontSize: 40.sp,
                                ),
                              ),
                              Text(
                                AppState.loginData?.user?.lastName ?? "",
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
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Row(
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
                      ),
                      SizedBox(
                        height: 96.h,
                      ),
                      /* Row(
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
                      ),*/
                      InkWell(
                        onTap: () {
                          Get.back();
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
                      SizedBox(
                        height: 96.h,
                      ),
                      InkWell(
                        onTap: () {
                          controller.removeUser();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              size: 62.w,
                              color: ColorConstant.grey.withOpacity(0.4),
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: ColorConstant.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 45.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 96.h,
                      ),
                    ],
                  ),
                ),
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
                Obx(
                  () => CarouselSlider.builder(
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
                        ImageConstant.indiaEmblemIcon,
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 122.h,
                ),
                Obx(
                  () => Text(
                    "${controller.quizResponse.value?.data![0].question}",
                    style: TextStyle(
                      color: ColorConstant.textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 45.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 34.h,
                ),
                Row(
                  children: [
                    Obx(
                      () => controller.quizResponse.value?.data![0].option1 !=
                              null
                          ? Expanded(
                              child: _buildPollOption(
                                  controller.quizResponse.value?.data![0]
                                          .option1 ??
                                      "",
                                  1),
                            )
                          : SizedBox.shrink(),
                    ),
                    Obx(
                      () => controller.quizResponse.value?.data![0].option2 !=
                              null
                          ? SizedBox(
                              width: 35.h,
                            )
                          : SizedBox.shrink(),
                    ),
                    Obx(
                      () => controller.quizResponse.value?.data![0].option2 !=
                              null
                          ? Expanded(
                              child: _buildPollOption(
                                  controller.quizResponse.value?.data![0]
                                          .option2 ??
                                      "",
                                  2),
                            )
                          : SizedBox.shrink(),
                    ),
                    Obx(
                      () => controller.quizResponse.value?.data![0].option3 !=
                              null
                          ? SizedBox(
                              width: 35.h,
                            )
                          : SizedBox.shrink(),
                    ),
                    Obx(
                      () => controller.quizResponse.value?.data![0].option3 !=
                              null
                          ? Expanded(
                              child: _buildPollOption(
                                  controller.quizResponse.value?.data![0]
                                          .option3 ??
                                      "",
                                  3),
                            )
                          : SizedBox.shrink(),
                    ),
                    Obx(
                      () => controller.quizResponse.value?.data![0].option4 !=
                              null
                          ? SizedBox(
                              width: 35.h,
                            )
                          : SizedBox.shrink(),
                    ),
                    Obx(
                      () => controller.quizResponse.value?.data![0].option4 !=
                              null
                          ? Expanded(
                              child: _buildPollOption(
                                  controller.quizResponse.value?.data![0]
                                          .option4 ??
                                      "",
                                  4),
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                ),
                Obx(
                  () => Column(
                    children: [
                      if (controller.quizResponse.value?.data![0].option1 !=
                          null)
                        SizedBox(
                          height: 31.h,
                        ),
                      if (controller.quizResponse.value?.data![0].option1 !=
                          null)
                        _buildQuiz(
                            "${controller.quizResponse.value?.data![0].option1}",
                            (((controller.quizResponse.value?.data![0]
                                            .pollOption1?.length ??
                                        0) *
                                    100) /
                                (controller.quizResponse.value?.data![0].poll
                                        ?.length ??
                                    0)),
                            1),
                    ],
                  ),
                ),
                Obx(
                  () => Column(
                    children: [
                      if (controller.quizResponse.value?.data![0].option2 !=
                          null)
                        SizedBox(
                          height: 9.h,
                        ),
                      if (controller.quizResponse.value?.data![0].option2 !=
                          null)
                        _buildQuiz(
                            "${controller.quizResponse.value?.data![0].option2}",
                            (((controller.quizResponse.value?.data![0]
                                            .pollOption2?.length ??
                                        0) *
                                    100) /
                                (controller.quizResponse.value?.data![0].poll
                                        ?.length ??
                                    0)),
                            2),
                    ],
                  ),
                ),
                Obx(
                  () => Column(
                    children: [
                      if (controller.quizResponse.value?.data![0].option3 !=
                          null)
                        SizedBox(
                          height: 9.h,
                        ),
                      if (controller.quizResponse.value?.data![0].option3 !=
                          null)
                        _buildQuiz(
                            "${controller.quizResponse.value?.data![0].option3}",
                            (((controller.quizResponse.value?.data![0]
                                            .pollOption3?.length ??
                                        0) *
                                    100) /
                                (controller.quizResponse.value?.data![0].poll
                                        ?.length ??
                                    0)),
                            3),
                    ],
                  ),
                ),
                Obx(
                  () => Column(
                    children: [
                      if (controller.quizResponse.value?.data![0].option4 !=
                          null)
                        SizedBox(
                          height: 9.h,
                        ),
                      if (controller.quizResponse.value?.data![0].option4 !=
                          null)
                        _buildQuiz(
                            "${controller.quizResponse.value?.data![0].option4}",
                            (((controller.quizResponse.value?.data![0]
                                            .pollOption4?.length ??
                                        0) *
                                    100) /
                                (controller.quizResponse.value?.data![0].poll
                                        ?.length ??
                                    0)),
                            4),
                    ],
                  ),
                ),
                SizedBox(
                  height: 122.h,
                ),
                Obx(
                  () => CarouselSlider.builder(
                    itemCount:
                        controller.bottomBannerResponse.value?.data?.length ??
                            0,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(31.r),
                          image: DecorationImage(
                              image: NetworkImage(controller
                                      .bottomBannerResponse
                                      .value
                                      ?.data?[itemIndex]
                                      .image ??
                                  ''),
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
                Obx(
                  () => SizedBox(
                    height: 400.h,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: (controller.bookCategoryResponse.value?.data
                                      ?.length ??
                                  0) >
                              5
                          ? 5
                          : controller
                                  .bookCategoryResponse.value?.data?.length ??
                              0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10, top: 30),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(NavigationName.bookCategoryPage,
                                  arguments: {
                                    AppConstants.bookCategoryId: controller
                                        .bookCategoryResponse
                                        .value
                                        ?.data![index]
                                        .id
                                  });
                            },
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
                                          controller.bookCategoryResponse.value
                                                  ?.data![index].name ??
                                              '',
                                          style: TextStyle(
                                            color: ColorConstant.textColor,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                                TextFontFamily.openSansBold,
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
                                      child: CachedNetworkImage(
                                          imageUrl: controller
                                                  .bookCategoryResponse
                                                  .value
                                                  ?.data![index]
                                                  .image ??
                                              'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
                                          height: 300.h,
                                          width: 370.h,
                                          fit: BoxFit.cover),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
                Obx(
                  () => SizedBox(
                    height: 400.h,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: (controller.videoCategoryResponse.value?.data
                                      ?.length ??
                                  0) >
                              5
                          ? 5
                          : controller
                                  .videoCategoryResponse.value?.data?.length ??
                              0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10, top: 30),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(NavigationName.videoCategoryPage,
                                  arguments: {
                                    AppConstants.bookCategoryId: controller
                                        .videoCategoryResponse
                                        .value
                                        ?.data![index]
                                        .id
                                  });
                            },
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
                                          controller.videoCategoryResponse.value
                                                  ?.data![index].name ??
                                              '',
                                          style: TextStyle(
                                            color: ColorConstant.textColor,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                                TextFontFamily.openSansBold,
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
                                      child: CachedNetworkImage(
                                          imageUrl: controller
                                                  .videoCategoryResponse
                                                  .value
                                                  ?.data![index]
                                                  .image ??
                                              'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
                                          height: 300.h,
                                          width: 370.h,
                                          fit: BoxFit.cover),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildQuiz(String name, double pr, int optionId) {
    return Stack(
      children: [
        Container(
          height: 113.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34.h),
            color: (optionId != controller.yourAnsId.value)
                ? ColorConstant.skillContainerColor
                : Color(0xffDAFFE4),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 5),
              height: 113.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34.h),
                    bottomLeft: Radius.circular(34.h),
                  ),
                  color: pr != 0
                      ? (optionId != controller.yourAnsId.value)
                          ? Color(0xffE2E2E2)
                          : Color(0xff59D77C)
                      : ColorConstant.skillContainerColor),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppUtils.getSVGAsset(ImageConstant.selectedIcon),
                    height: 25,
                    color: (optionId != controller.yourAnsId.value)
                        ? ColorConstant.text1Color
                        : Colors.black,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: (optionId != controller.yourAnsId.value)
                          ? ColorConstant.text1Color
                          : Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: TextFontFamily.openSansBold,
                      fontSize: 30.sp,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    children: [
                      Container(
                        height: 113.h,
                        width: (constraints.maxWidth * pr) / 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              (optionId != controller.yourAnsId.value)
                                  ? Color(0xffE2E2E2)
                                  : Color(0xff59D77C),
                              (optionId != controller.yourAnsId.value)
                                  ? Color(0xfff1f1f1)
                                  : Color(0xffA4FDBD)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                pr.toStringAsFixed(2),
                                style: TextStyle(
                                  color:
                                      (optionId != controller.yourAnsId.value)
                                          ? ColorConstant.text1Color
                                          : Colors.black,
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
                  );
                },
              ),
            ),
          ],
        )
      ],
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

  _buildPollOption(String title, id) {
    return GestureDetector(
      onTap: () {
        if (controller.yourAnsId.value == 0) {
          controller.yourAnsId.value = id;
          controller.addPoll(id);
        }
      },
      child: Container(
        height: 113.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34.h),
          border: Border.all(
            color: controller.yourAnsId.value == id
                ? ColorConstant.borderColor
                : Color(0xffDADADA),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: ColorConstant.textColor,
              fontWeight: FontWeight.w700,
              fontFamily: TextFontFamily.openSensRegular,
              fontSize: 30.sp,
            ),
          ),
        ),
      ),
    );
  }
}
