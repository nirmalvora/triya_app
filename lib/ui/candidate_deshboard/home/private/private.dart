import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/model/private_job_response_model.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/private_job_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';

class PrivateJobScreen extends StatefulWidget {
  const PrivateJobScreen({Key? key}) : super(key: key);

  @override
  _PrivateJobScreenState createState() => _PrivateJobScreenState();
}

class _PrivateJobScreenState extends State<PrivateJobScreen> {
  int selected = 0;
  final controller = Get.put(PrivateJobController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.privateJobBgColor,
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
          "Private Job",
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
                        hintText: "Search for job here...",
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
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Obx(
            () => SizedBox(
              height: 100.h,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount:
                    controller.privateJobResponse.value?.data?.length ?? 0,
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
                            controller.privateJobResponse.value?.data?[index]
                                    .name ??
                                "",
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
          ),
          SizedBox(
            height: 50.h,
          ),
          Obx(
            () => controller.privateJobResponse.value?.data != null &&
                    controller.privateJobResponse.value!.data!.isNotEmpty
                ? Expanded(
                    child: Obx(
                    () => ((controller.privateJobResponse.value?.data?[selected]
                                        .employee
                                        ?.where(((element) => element.jobTitle!
                                            .toLowerCase()
                                            .contains(controller
                                                .searchText.value
                                                .toLowerCase())))
                                        .length ??
                                    0) ==
                                0) &&
                            controller.loading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ((controller.privateJobResponse.value?.data?.length ??
                                    0) ==
                                0)
                            ? Center(
                                child: Text("No Data Found"),
                              )
                            : ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.privateJobResponse.value
                                        ?.data?[selected].employee
                                        ?.where(((element) => element.jobTitle!
                                            .toLowerCase()
                                            .contains(controller
                                                .searchText.value
                                                .toLowerCase())))
                                        .length ??
                                    0,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  PostedJob data = (controller
                                      .privateJobResponse
                                      .value
                                      ?.data?[selected]
                                      .employee
                                      ?.where(((element) => element.jobTitle!
                                          .toLowerCase()
                                          .contains(controller.searchText.value
                                              .toLowerCase())))
                                      .toList()[index])!;

                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          NavigationName.privateJobDescPage,
                                          arguments: {
                                            "private_job_data": data
                                          });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 7),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          gradient: LinearGradient(
                                            colors: const [
                                              Color(0xffffffff),
                                              ColorConstant.privateJobBgColor
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            data.jobTitle ?? "",
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                              color:
                                                                  ColorConstant
                                                                      .textColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 30.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Text(
                                                      'Post Date: ${data.fromDate ?? ""}     |     Last Date:  ${data.toDate ?? ""}',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        color: ColorConstant
                                                            .hintTextColor,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 25.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
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
                                                      BorderRadius.circular(
                                                          27.h),
                                                ),
                                                child: Icon(
                                                  Icons
                                                      .keyboard_arrow_right_outlined,
                                                  color: ColorConstant
                                                      .backgroundColor,
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
                  ))
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
