import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyAccountController extends GetxController {
  final firstNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final lastNameController = TextEditingController();
}
