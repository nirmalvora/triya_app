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

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
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
              'Select Book Category',
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
                () => ((controller.bookCategoryResponse.value?.data
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
                    : ((controller.bookCategoryResponse.value?.data?.length ??
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
                                    .bookCategoryResponse.value?.data
                                    ?.where(((element) => element.name!
                                        .toLowerCase()
                                        .contains(controller.searchText.value
                                            .toLowerCase())))
                                    .length ??
                                0,
                            itemBuilder: (BuildContext context, int index) {
                              BookCategoryData data = (controller
                                  .bookCategoryResponse.value!.data!
                                  .where(((element) => element.name!
                                      .toLowerCase()
                                      .contains(controller.searchText.value
                                          .toLowerCase())))
                                  .toList()[index]);
                              return GestureDetector(
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
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r)),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: CachedNetworkImage(
                                          imageUrl: controller
                                                  .bookCategoryResponse
                                                  .value
                                                  ?.data![index]
                                                  .image ??
                                              'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
                                          height: 230.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      data.name ?? '',
                                      style: TextStyle(
                                        color: ColorConstant.textColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25.sp,
                                      ),
                                    ),
                                  ],
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
