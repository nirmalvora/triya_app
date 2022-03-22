import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/ui/candidate_deshboard/home/drawer/apply_job_controller.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';

class AppliedJobs extends StatelessWidget {
  AppliedJobs({Key? key}) : super(key: key);
  final controller = Get.put(AppliedJobController());

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
          "Applied Jobs",
          style: TextStyle(color: ColorConstant.splashColor),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: AppBarCircleAvtar(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(
          () => ((controller.appliedJob.value?.data?.length ?? 0) == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ((controller.appliedJob.value?.data?.length ?? 0) == 0)
                  ? Center(
                      child: Text("No Data Found"),
                    )
                  : ListView.builder(
                      itemCount: controller.appliedJob.value?.data?.length ?? 0,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 24.h),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffEEF5FF),
                              borderRadius: BorderRadius.circular(88.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(22.r),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 7),
                                      child: Text(
                                        controller.appliedJob.value
                                                ?.data![index].jobTitle ??
                                            "",
                                        style: TextStyle(
                                            fontFamily: "OpenSans-Regular",
                                            color: ColorConstant.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  /*InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 91.h,
                                      width: 91.w,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xff3782F3)),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.download_rounded,
                                        size: 18,
                                        color: Color(0xff3782F3),
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )),
        ),
      ),
    );
  }
}
