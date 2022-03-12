import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/utils/app_utils.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.offNamed(NavigationName.bookCategoryPage);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          AppUtils.getPNGAsset(ImageConstant.bookImage),
                          height: 255.h,
                        ),
                        Text(
                          'Book Category',
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
            )
          ],
        ),
      ),
    );
  }
}
