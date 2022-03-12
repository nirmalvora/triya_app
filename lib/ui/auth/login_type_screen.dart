import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:triya_app/navigation/navigation_constant.dart';

import '../../utils/app_utils.dart';

class LoginTypeScreen extends StatelessWidget {
  const LoginTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(AppUtils.getPNGAsset("login_type_background"),
                fit: BoxFit.cover),
          ),
          Positioned(
            top: (-1264.r / 2) + MediaQuery.of(context).padding.top + 100.h,
            left: 0,
            right: 0,
            child: Container(
              height: 1264.r,
              width: 1264.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.11),
                    Colors.white.withOpacity(0)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: (-1264.r / 2) + MediaQuery.of(context).padding.top + 100.h,
            left: 0,
            right: 0,
            child: Container(
              height: 1264.r,
              width: 1264.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.11),
                    Colors.white.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (1264.r / 2) - 50.h,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(NavigationName.candidateLoginType);
              },
              child: Container(
                height: 430.r,
                width: 430.r,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1)),
                child: Center(
                  child: Container(
                    height: 346.r,
                    width: 346.r,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1)),
                    child: Center(
                      child: Container(
                        height: 262.r,
                        width: 262.r,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: Image.asset(
                            AppUtils.getPNGAsset('right_job'),
                            height: 106.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: (1264.r / 2) - 120.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text("Find The Right Job".toUpperCase(),
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          Positioned(
            bottom: (1264.r / 2) - 120.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text("Find The Right Candidate".toUpperCase(),
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          Positioned(
            bottom: (1264.r / 2) - 50.h,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                print("Dataaaa");
              },
              child: Container(
                height: 430.r,
                width: 430.r,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1)),
                child: Center(
                  child: Container(
                    height: 346.r,
                    width: 346.r,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1)),
                    child: Center(
                      child: Container(
                        height: 262.r,
                        width: 262.r,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: Container(
                            height: 262.r,
                            width: 262.r,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Center(
                              child: Image.asset(
                                AppUtils.getPNGAsset('candidate_icon'),
                                height: 106.r,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
