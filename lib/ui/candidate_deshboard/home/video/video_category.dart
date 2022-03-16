import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/video/video_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCategoryScreen extends StatefulWidget {
  const VideoCategoryScreen({Key? key}) : super(key: key);

  @override
  _VideoCategoryScreenState createState() => _VideoCategoryScreenState();
}

class _VideoCategoryScreenState extends State<VideoCategoryScreen> {
  final controller = Get.put(VideoController());
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
            child: CircleAvatar(
              radius: 22,
              child: Image.asset(
                AppUtils.getPNGAsset(ImageConstant.myProfileIcon),
              ),
            ),
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
            Expanded(
              child: Obx(
                () => controller.videoDataResponse.value == null &&
                        controller.loading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ((controller.videoDataResponse.value?.data?.length ??
                                0) ==
                            0)
                        ? Center(
                            child: Text("No Data Found"),
                          )
                        : ListView.builder(
                            itemCount: controller
                                    .videoDataResponse.value?.data?.length ??
                                0,
                            padding: EdgeInsets.zero,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                child: GestureDetector(
                                  onTap: () async {
                                    var _url = controller.videoDataResponse
                                            .value?.data?[index].url ??
                                        "www.google.com";
                                    if (!await launch(_url)) {
                                      throw 'Could not launch $_url';
                                    }
                                  },
                                  child: Container(
                                    height: 163.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xffF6F6F6),
                                      borderRadius: BorderRadius.circular(30.h),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: 120.h,
                                            width: 130.h,
                                            decoration: BoxDecoration(
                                              color:
                                                  ColorConstant.backgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                AppUtils.getPNGAsset(
                                                    ImageConstant
                                                        .videoDefaultIcon),
                                                width: 76.h,
                                                height: 76.h,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.h,
                                          ),
                                          Text(
                                            controller.videoDataResponse.value
                                                    ?.data?[index].title ??
                                                "",
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: ColorConstant.textColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 30.sp,
                                            ),
                                          ),
                                          Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                controller.addToFavotite(
                                                    controller
                                                            .videoDataResponse
                                                            .value
                                                            ?.data?[index]
                                                            .id ??
                                                        0,
                                                    index,
                                                    (controller
                                                                .videoDataResponse
                                                                .value
                                                                ?.data?[index]
                                                                .favoriteBook) ==
                                                            null
                                                        ? -1
                                                        : (controller
                                                            .videoDataResponse
                                                            .value!
                                                            .data![index]
                                                            .favoriteBook!
                                                            .id!));
                                              },
                                              icon: Icon((controller
                                                          .videoDataResponse
                                                          .value
                                                          ?.data?[index]
                                                          .favoriteBook) ==
                                                      null
                                                  ? Icons.favorite_border_sharp
                                                  : Icons.favorite))
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
      ),
    );
  }
}
