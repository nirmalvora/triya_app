import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/fontfamily_constant.dart';
import 'package:triya_app/constants/image_constant.dart';
import 'package:triya_app/local_data/app_state.dart';
import 'package:triya_app/ui/candidate_deshboard/home/drawer/my_account_controller.dart';
import 'package:triya_app/ui/candidate_deshboard/home/home_controller.dart';
import 'package:triya_app/utils/app_utils.dart';
import 'package:triya_app/widgets/cache_imageview.dart';

class MyAccount extends StatefulWidget {
  MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final controller = Get.put(HomeController());
  final myController = Get.put(MyAccountController());

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
          "My Account",
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  myController.getImage();
                },
                child: CircleAvatar(
                  backgroundColor: ColorConstant.backgroundColor,
                  radius: 45,
                  child: ClipOval(
                    child: Obx(
                      () => myController.image.value == null
                          ? Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCubUN2VDqYNO0nfbwpiJmiHwmkXyux32Izw&usqp=CAU",
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            )
                          : Image.file(
                              myController.image.value!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Row(
                      children: [
                        Text(
                          AppState.loginData.value?.user?.firstName!
                                  .toUpperCase() ??
                              "",
                          style: TextStyle(
                            color: ColorConstant.textColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: TextFontFamily.openSansBold,
                            fontSize: 40.sp,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          AppState.loginData.value?.user?.lastName!
                                  .toUpperCase() ??
                              "",
                          style: TextStyle(
                            color: ColorConstant.textColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: TextFontFamily.openSansBold,
                            fontSize: 40.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDeviceNameChangeDialog();
                    },
                    child: Icon(
                      Icons.edit,
                      size: 20,
                      color: ColorConstant.textColor,
                    ),
                  ),
                ],
              ),
              Text(
                "${AppState.loginData.value?.user?.email}",
                style: TextStyle(
                  color: ColorConstant.textColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: TextFontFamily.openSansBold,
                  fontSize: 40.sp,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  controller.removeUser();
                },
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
                        'LogOut',
                        style: TextStyle(
                          color: ColorConstant.backgroundColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: TextFontFamily.openSansBold,
                          fontSize: 40.sp,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom.h + 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void showDeviceNameChangeDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Form(
              key: myController.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    onChanged: (value) {},
                    controller: myController.firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter firstname';
                      }
                      return null;
                    },
                    style: TextStyle(),
                    textInputAction: TextInputAction.next,
                    decoration: customInputDecoration("First Name"),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    controller: myController.lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter lastname';
                      }
                      return null;
                    },
                    style: TextStyle(),
                    textInputAction: TextInputAction.next,
                    decoration: customInputDecoration("Last Name"),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      myController.updateData();
                      Get.back();
                    },
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
                            colors: const [
                              Color(0xff3782F3),
                              Color(0xff276ED8)
                            ],
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
                              fontSize: 40.sp,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

customInputDecoration(hintText, {Widget? suffixIcon, String? icon}) =>
    InputDecoration(
      hintText: hintText,
      fillColor: Colors.grey.withOpacity(0.3),
      filled: true,
      suffixIcon: suffixIcon,
      prefixIcon: icon != null
          ? IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 40,
                    child: Center(
                      child: Image.asset(
                        "assets/images/$icon.png",
                        color: Colors.grey,
                        height: 22,
                        width: 22,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 4,
                    indent: 12,
                    endIndent: 12,
                    color: Colors.grey,
                  ),
                ],
              ),
            )
          : null,
      isDense: true,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade100)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade100)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.red.shade100)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade100)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade100)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.grey.shade100)),
    );
