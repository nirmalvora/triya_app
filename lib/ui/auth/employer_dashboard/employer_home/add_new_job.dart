import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/model/add_new_job_category_res_model.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/add_new_job_controller.dart';
import 'package:triya_app/utils/date_formate_utils.dart';
import 'package:triya_app/widgets/appbar_circleavtar.dart';
import 'package:triya_app/widgets/textfield_decoration.dart';

class AddNewJobScreen extends StatefulWidget {
  AddNewJobScreen({Key? key}) : super(key: key);

  @override
  State<AddNewJobScreen> createState() => _AddNewJobScreenState();
}

class _AddNewJobScreenState extends State<AddNewJobScreen> {
  final controller = Get.put(AddNewJobController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.splashColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: Center(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  height: 115.h,
                  width: 115.h,
                  decoration: BoxDecoration(
                      color: Color(0xff2A70DA), shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 50.r,
                  )),
            ),
          ),
        ),
        title: Text(
          'Add New Job',
          style: TextStyle(
              fontFamily: "OpenSans-Regular",
              color: ColorConstant.white,
              fontWeight: FontWeight.w700,
              fontSize: 52.sp),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.w, bottom: 10.h),
            child: AppBarCircleAvtar(),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 78.h),
                Row(
                  children: [
                    CommanDatePicker(
                      onTap: () {
                        _selectPostDate(context);
                      },
                      title: 'Post Date',
                      selectDate: DateFormatUtils.ddMMyyyyFromDate(
                          controller.selectedDate),
                    ),
                    SizedBox(width: 30.w),
                    CommanDatePicker(
                      onTap: () {
                        _selectLastDate(context);
                      },
                      title: 'Last Date',
                      selectDate:
                          DateFormatUtils.ddMMyyyyFromDate(controller.select),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                CommanTitle(title: 'Job Title'),
                TextFormField(
                  controller: controller.jobTitle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter job title';
                    }
                    return null;
                  },
                  decoration: customInputDecoration(
                      '', Color(0xffF6F6F6), Color(0xffF6F6F6)),
                ),
                SizedBox(height: 30.h),
                CommanTitle(title: 'Job Link'),
                TextFormField(
                  controller: controller.jobLink,
                  decoration: customInputDecoration(
                      '', Color(0xffF6F6F6), Color(0xffF6F6F6)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter job link';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.h),
                CommanTitle(title: 'Qualification'),
                TextFormField(
                  controller: controller.qualification,
                  decoration: customInputDecoration(
                      '', Color(0xffF6F6F6), Color(0xffF6F6F6)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter qualification';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.h),
                CommanTitle(title: 'job Details'),
                TextFormField(
                  controller: controller.jobDetails,
                  maxLines: 3,
                  decoration: customInputDecoration(
                      '', Color(0xffF6F6F6), Color(0xffF6F6F6)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter job details';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.h),
                CommanTitle(title: 'Job City'),
                TextFormField(
                  controller: controller.jobCity,
                  decoration: customInputDecoration(
                      '', Color(0xffF6F6F6), Color(0xffF6F6F6)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter job city';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.h),
                CommanTitle(title: 'Job category'),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(19.r)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Expanded(
                            child: DropdownButtonFormField(
                              iconSize: 0,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              hint: Text('Select Category'),
                              validator: (value) => value == null
                                  ? 'Please select category'
                                  : null,
                              elevation: 0,
                              value: controller.dropdownValue,
                              items: (controller
                                          .categoryListResponse.value?.data ??
                                      [])
                                  .map<DropdownMenuItem<String>>(
                                      (CategoryListData value) {
                                return DropdownMenuItem<String>(
                                  value: value.id.toString(),
                                  child: Text('${value.name}'),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  controller.dropdownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                InkWell(
                  onTap: () {
                    controller.getPdf();
                  },
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      'Upload Pdf',
                      style: TextStyle(
                          color: Color(0xff286FD9),
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "OpenSans-Regular"),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.upload_rounded,
                      color: Color(0xff286FD9),
                      size: 18,
                    )
                  ]),
                ),
                SizedBox(height: 180.h),
                CommanButton(
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.addNewJob();
                      }
                    },
                    text: 'Create Job'),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectPostDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
    if (selected != null && selected != controller.selectedDate) {
      setState(() {
        controller.selectedDate = selected;
      });
    }
  }

  _selectLastDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: controller.select,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
    if (selected != null && selected != controller.select) {
      setState(() {
        controller.select = selected;
      });
    }
  }
}

class CommanDatePicker extends StatelessWidget {
  String title;
  Function() onTap;
  String selectDate;

  CommanDatePicker(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.selectDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
              fontFamily: "OpenSans-Regular",
              fontSize: 12,
              color: ColorConstant.black,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 23.h),
        InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19.r),
                  color: Color(0xffF6F6F6)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 36.h),
                child: Text(
                  selectDate,
                  style: TextStyle(
                      color: Color(0xff737373),
                      fontFamily: "OpenSans-Regular",
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            )),
      ],
    );
  }
}

class CommanButton extends StatelessWidget {
  String text;
  Function() onTap;
  CommanButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19.r),
            border: Border.all(color: ColorConstant.blueColor)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 37.h),
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                  fontFamily: "OpenSans-Regular",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  color: Color(0xff1F63C9),
                  fontSize: 32.sp),
            ),
          ),
        ),
      ),
    );
  }
}

class CommanTitle extends StatelessWidget {
  String title;
  CommanTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 23.h),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
            fontFamily: "OpenSans-Regular",
            fontSize: 12,
            color: ColorConstant.black,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
