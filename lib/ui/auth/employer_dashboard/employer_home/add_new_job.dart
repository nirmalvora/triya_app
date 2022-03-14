import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/utils/date_formate_utils.dart';

class AddNewJobScreen extends StatefulWidget {
  AddNewJobScreen({Key? key}) : super(key: key);

  @override
  State<AddNewJobScreen> createState() => _AddNewJobScreenState();
}

class _AddNewJobScreenState extends State<AddNewJobScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime select = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.splashColor,
        leading: Center(
            child: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: SvgPicture.asset(
            AppUtils.getSVGAsset(ImageConstant.appbar_icon),
            height: 115.h,
            width: 115.h,
          ),
        )),
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
            padding: EdgeInsets.only(right: 30.w),
            child: Center(
              child: Container(
                height: 115.h,
                width: 115.h,
                decoration: BoxDecoration(
                    color: ColorConstant.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffE9E9E9), width: 3)),
                child: ClipOval(
                  child: Image.network(
                    'https://s3-alpha-sig.figma.com/img/5387/ddcd/21388124e311307deee7a85f44bd1b8a?Expires=1648425600&Signature=PyYl48Eck5h8SBcMaDRIyCz-X9rzWs7zsRnfGTyb~zRq2SlR04gvUFTRLdOh48UBqO3j~gV2l55wZ-ZPjfQmLSi8eoh6Wq7D7JatJRFLeOSFfybCrZi~H8GljKEvJVeb-~oQ9FN3zOOPNzlCITqnLSyL8iRio8Ef7ULzfQUAHaDR-TqdbKhQU3HbCRVbQO1PDsvsodqF3WmQnhHGtq7oQxTFK1bgWbQX8-yJ901xP3rs2kKXbDKtL-LfBFepB~-l2zJ7W-KBmotXvAxKo5-AmrO5oNXD6PvymKsSGBcPdid9Y3FewHGVLj0z6IP5-28UBevK796~kI8EGqKNf-uZbw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                    height: 77.h,
                    width: 77.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                    selectDate:
                        '${DateFormatUtils.ddMMMFromDate(selectedDate)} ${selectedDate.year}',
                  ),
                  SizedBox(width: 30.w),
                  CommanDatePicker(
                    onTap: () {
                      _selectLastDate(context);
                    },
                    title: 'Post Date',
                    selectDate:
                        '${DateFormatUtils.ddMMMFromDate(select)} ${select.year}',
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              NewJobCommanField(title: 'Job Title'),
              SizedBox(height: 30.h),
              NewJobCommanField(title: 'Job Link'),
              SizedBox(height: 30.h),
              NewJobCommanField(title: 'Qualification'),
              SizedBox(height: 30.h),
              NewJobCommanField(title: 'job Details'),
              SizedBox(height: 50.h),
              InkWell(
                onTap: () {},
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
              CommanButton(onTap: () {}, text: 'Create Job'),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
            ],
          ),
        ),
      ),
    );
  }

  _selectPostDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  _selectLastDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: select,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
    if (selected != null && selected != select) {
      setState(() {
        select = selected;
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

class NewJobCommanField extends StatelessWidget {
  String title;

  NewJobCommanField({Key? key, required this.title}) : super(key: key);

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
        TextFormField(
          decoration: InputDecoration(
            fillColor: Color(0xffF6F6F6),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(19.r),
                borderSide: BorderSide(color: Color(0xffF6F6F6))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(19.r),
                borderSide: BorderSide(color: Color(0xffF6F6F6))),
          ),
        )
      ],
    );
  }
}
