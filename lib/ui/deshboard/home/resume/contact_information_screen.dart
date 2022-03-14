import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/utils/app_utils.dart';

class ContactInformationScreen extends StatelessWidget {
  const ContactInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.jobBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorConstant.splashColor,
              image: DecorationImage(
                image: AssetImage(
                  AppUtils.getPNGAsset(ImageConstant.backgroundImage),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xff2C72DB),
                      radius: 20,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Text(
                    'PERSONAL STATEMENT',
                    style: TextStyle(
                      color: ColorConstant.backgroundColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 35.sp,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MOBILE NO. *',
                  style: TextStyle(
                    color: ColorConstant.splashColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: TextFontFamily.openSansBold,
                    fontSize: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorConstant.backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet condimentum ullamcorper amet tristique et enim mauris. Laoreet curabitur maecenas elit enim sed. Consequat porta tellus bibendum mattis est. Imperdiet pretium, bibendum sagittis, vitae tortor nibh.',
                      style: TextStyle(
                        color: ColorConstant.splashColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: TextFontFamily.openSansBold,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Container(
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstant.splashColor,
              ),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: const [Color(0xff3782F3), Color(0xff276ED8)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                      color: ColorConstant.backgroundColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: TextFontFamily.openSansBold,
                      fontSize: 35.sp,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
