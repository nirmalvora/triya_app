import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/drawer/favorites_video_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritesVideoScreen extends StatelessWidget {
  FavoritesVideoScreen({Key? key}) : super(key: key);
  final controller = Get.put(FavoritesVideoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
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
          "Favorites Videos",
          style: TextStyle(color: ColorConstant.splashColor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: AppBarCircleAvtar(),
          ),
        ],
      ),
      body: Obx(
        () => ((controller.videoDataResponse.value?.data?.length ?? 0) == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ((controller.videoDataResponse.value?.data?.length ?? 0) == 0)
                ? Center(
                    child: Text("No Data Found"),
                  )
                : ListView.builder(
                    itemCount:
                        controller.videoDataResponse.value?.data?.length ?? 0,
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: GestureDetector(
                          onTap: () async {
                            var _url = controller.videoDataResponse.value
                                    ?.data?[index].url ??
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    height: 120.h,
                                    width: 130.w,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.backgroundColor,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        AppUtils.getPNGAsset(
                                            ImageConstant.videoDefaultIcon),
                                        width: 76.w,
                                        height: 76.h,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.h,
                                  ),
                                  Expanded(
                                    child: Text(
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
                                  ),
                                  IconButton(
                                      splashRadius: 20,
                                      onPressed: () {
                                        controller.addToFavotite(
                                            controller.videoDataResponse.value
                                                    ?.data?[index].id ??
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
                  )),
      ),
    );
  }
}
