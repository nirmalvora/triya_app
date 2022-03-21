import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/gov/gov_job_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';

class GovJobScreen extends StatefulWidget {
  const GovJobScreen({Key? key}) : super(key: key);

  @override
  _GovJobScreenState createState() => _GovJobScreenState();
}

class _GovJobScreenState extends State<GovJobScreen> {
  final controller = Get.put(GovJobController());
  int? selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
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
          "GOVT.JOBS",
          style: TextStyle(color: ColorConstant.splashColor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: AppBarCircleAvtar(),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: ColorConstant.backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Row(
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
                        hintText: "Search for job here",
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
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
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
                      width: 320.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: selected == index
                            ? ColorConstant.blueColor
                            : ColorConstant.backgroundColor,
                      ),
                      child: Center(
                        child: Text(
                          'Category A',
                          style: TextStyle(
                            color: ColorConstant.textColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: TextFontFamily.openSansBold,
                            fontSize: 30.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          /*  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Category A Jobs',
              style: TextStyle(
                color: ColorConstant.textColor,
                fontWeight: FontWeight.w700,
                fontFamily: TextFontFamily.openSansBold,
                fontSize: 52.sp,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet vitae pulvinar sagittis.',
              style: TextStyle(
                color: ColorConstant.textColor,
                fontWeight: FontWeight.w700,
                fontFamily: TextFontFamily.openSansBold,
                fontSize: 22.sp,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),*/
          Expanded(
            child: Obx(
              () => ((controller.govJobResponse.value?.data
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
                  : ((controller.govJobResponse.value?.data?.length ?? 0) == 0)
                      ? Center(
                          child: Text("No Data Found"),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.govJobResponse.value?.data
                                  ?.where(((element) => element.title!
                                      .contains(controller.searchText.value)))
                                  .length ??
                              0,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(NavigationName.govJobDescPage,
                                    arguments: {
                                      "gov_job_data": controller
                                          .govJobResponse.value?.data?[index]
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 7),
                                child: Container(
                                  height: 140.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      colors: const [
                                        Color(0xffffffff),
                                        Color(0xffDFECFE)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              controller.govJobResponse.value
                                                      ?.data?[index].title ??
                                                  "",
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: ColorConstant.textColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 30.sp,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Post Date: ${controller.govJobResponse.value?.data?[index].postDate ?? ""}     |     Last Date:  ${controller.govJobResponse.value?.data?[index].lastDate ?? ""}',
                                              maxLines: 2,
                                              style: TextStyle(
                                                color:
                                                    ColorConstant.hintTextColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 25.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          height: 100.h,
                                          width: 100.h,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: const [
                                                Color(0xff3782F3),
                                                Color(0xff276ED8)
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(27.h),
                                          ),
                                          child: Icon(
                                            Icons.keyboard_arrow_right_outlined,
                                            color:
                                                ColorConstant.backgroundColor,
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
          )
        ],
      ),
    );
  }
}
