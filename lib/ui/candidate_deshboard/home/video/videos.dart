import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/model/book_category_response.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/home_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: ColorConstant.droverButtonColor,
              radius: 18,
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: Text(
          "Videos",
          style: TextStyle(color: ColorConstant.splashColor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: AppBarCircleAvtar(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      controller.searchText.value = value;
                      controller.searchText.refresh();
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xffF5F5F5),
                      filled: true,
                      hintText: "Search for book category here",
                      hintStyle: TextStyle(
                        fontSize: 26.h,
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 48,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.h),
                    color: ColorConstant.droverButtonColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppUtils.getSVGAsset(ImageConstant.filterIcon),
                      width: 52.h,
                      height: 47.h,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 56.h,
            ),
            Text(
              'Select Video Category',
              style: TextStyle(
                color: ColorConstant.textColor,
                fontWeight: FontWeight.w700,
                fontSize: 52.sp,
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Expanded(
              child: Obx(
                () => ((controller.videoCategoryResponse.value?.data
                                    ?.where(((element) => element.name!
                                        .toLowerCase()
                                        .contains(controller.searchText.value
                                            .toLowerCase())))
                                    .length ??
                                0) ==
                            0) ==
                        null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ((controller.videoCategoryResponse.value?.data?.length ??
                                0) ==
                            0)
                        ? Center(
                            child: Text("No Data Found"),
                          )
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: controller
                                    .videoCategoryResponse.value?.data
                                    ?.where(((element) => element.name!
                                        .toLowerCase()
                                        .contains(controller.searchText.value
                                            .toLowerCase())))
                                    .length ??
                                0,
                            itemBuilder: (BuildContext context, int index) {
                              BookCategoryData data = (controller
                                  .videoCategoryResponse.value?.data
                                  ?.where(((element) => element.name!
                                      .toLowerCase()
                                      .contains(controller.searchText.value
                                          .toLowerCase())))
                                  .toList())![index];
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(NavigationName.videoCategoryPage,
                                      arguments: {
                                        AppConstants.bookCategoryId: controller
                                                .bookCategoryResponse
                                                .value
                                                ?.data?[index]
                                                .id ??
                                            0
                                      });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(16.r)),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16.r)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          child: Stack(
                                            children: [
                                              CachedNetworkImage(
                                                  imageUrl: data.image ??
                                                      'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
                                                  height: 220.h,
                                                  fit: BoxFit.cover),
                                              Positioned(
                                                top: 0,
                                                bottom: 0,
                                                left: 0,
                                                right: 0,
                                                child: Center(
                                                  child: Image.asset(
                                                    AppUtils.getPNGAsset(
                                                        'video_play_icon'),
                                                    height: 100.h,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        data.name ?? "",
                                        style: TextStyle(
                                          color: ColorConstant.textColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 25.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
