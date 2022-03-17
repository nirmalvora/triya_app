import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddNewJobController extends GetxController {
  DateTime selectedDate = DateTime.now();
  DateTime select = DateTime.now();

  final jobTitle = TextEditingController();
  final jobLink = TextEditingController();
  final qualification = TextEditingController();
  final jobDetails = TextEditingController();
}
