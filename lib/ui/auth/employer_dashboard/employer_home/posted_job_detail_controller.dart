import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/apply_job_response.dart';
import 'package:triya_app/model/posted_job_res_model.dart';
import 'package:triya_app/services/api_service_methods.dart';

class PostedJobDetailController extends GetxController {
  final postedJob = Rx<PostedJob?>(null);

  @override
  void onInit() {
    postedJob.value = Get.arguments['get-job-post'];
    super.onInit();
  }
}
// /$id
