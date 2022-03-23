import 'dart:io';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/private_job_response_model.dart';
import 'package:triya_app/model/resume_response_model.dart';
import 'package:triya_app/services/api_service_methods.dart';

class PrivateJobDetailController extends GetxController {
  final govJob = Rx<PostedJob?>(null);
  static var httpClient = HttpClient();

  @override
  void onInit() {
    govJob.value = Get.arguments['private_job_data'];
    super.onInit();
  }

  void getData() {
    BaseApiService.instance.get(ServiceConstant.getResume).then((value) {
      ResumeResponseModel responseModel =
          ResumeResponseModel.fromJson(value!.data);
      print(responseModel);
    });
  }
}
