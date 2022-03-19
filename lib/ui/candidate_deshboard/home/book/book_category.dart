import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/book/book_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class BookCategoryScreen extends StatefulWidget {
  const BookCategoryScreen({Key? key}) : super(key: key);

  @override
  _BookCategoryScreenState createState() => _BookCategoryScreenState();
}

class _BookCategoryScreenState extends State<BookCategoryScreen> {
  final controller = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
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
          "Books",
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
        padding: const EdgeInsets.symmetric(vertical: 5),
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
              height: 20,
            ),
            Expanded(
              child: Obx(
                () => ((controller.bookDataResponse.value?.data
                                        ?.where(((element) => element.title!
                                            .contains(
                                                controller.searchText.value)))
                                        .length ??
                                    0) ==
                                0) ==
                            null &&
                        controller.loading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ((controller.bookDataResponse.value?.data?.length ?? 0) ==
                            0)
                        ? Center(
                            child: Text("No Data Found"),
                          )
                        : ListView.builder(
                            itemCount: controller.bookDataResponse.value?.data
                                    ?.where(((element) => element.title!
                                        .contains(controller.searchText.value)))
                                    .length ??
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
                                    var _url = controller.bookDataResponse.value
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
                                                    ImageConstant.bookIcon),
                                                width: 76.h,
                                                height: 76.h,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.h,
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller.bookDataResponse.value
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
                                                controller.addToFavorite(
                                                    controller
                                                            .bookDataResponse
                                                            .value
                                                            ?.data?[index]
                                                            .id ??
                                                        0,
                                                    index,
                                                    (controller
                                                                .bookDataResponse
                                                                .value
                                                                ?.data?[index]
                                                                .favoriteBook) ==
                                                            null
                                                        ? -1
                                                        : (controller
                                                            .bookDataResponse
                                                            .value!
                                                            .data![index]
                                                            .favoriteBook!
                                                            .id!));
                                              },
                                              icon: Icon((controller
                                                          .bookDataResponse
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
