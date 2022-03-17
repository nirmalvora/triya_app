import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/posted_job_res_model.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/utils/date_formate_utils.dart';

class AddNewJobController extends GetxController {
  DateTime selectedDate = DateTime.now();
  DateTime select = DateTime.now();

  final formKey = GlobalKey<FormState>();
  final jobTitle = TextEditingController();
  final jobLink = TextEditingController();
  final qualification = TextEditingController();
  final jobDetails = TextEditingController();

  void addNewJob() {
    if (formKey.currentState!.validate()) {
      /*    print(jobTitle.text);
      print(jobLink.text);
      print(qualification.text);
      print(jobDetails.text);*/
      Map<String, dynamic> data = {
        'from_date': DateFormatUtils.ddMMyyyyFromDate(selectedDate),
        'to_date': DateFormatUtils.ddMMyyyyFromDate(select),
        'job_title': jobTitle.text,
        'job_link': jobLink.text,
        'qualification': qualification.text,
        'job_detail': jobDetails.text,
      };
      BaseApiService.instance
          .post(ServiceConstant.AddNewJob, data: data)
          .then((value) {
        PostedJobResModel response = PostedJobResModel.fromJson(value!.data);
        Get.snackbar(response.message!, "");
      });
    }
  }
}
