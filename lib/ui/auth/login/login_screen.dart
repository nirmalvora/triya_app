import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/text_style.dart';
import 'package:triya_app/navigation/navigation_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Base Project',
          style:
              TextStyleRes.body2.copyWith(color: ColorConstant.backgroundColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.offNamed(NavigationName.homePage);
              },
              child: Center(
                child: Text("login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
