import 'package:get/get.dart';
import 'package:triya_app/model/private_job_response_model.dart';

class PostedJobDetailController extends GetxController {
  final postedJob = Rx<PostedJob?>(null);

  @override
  void onInit() {
    postedJob.value = Get.arguments['get-job-post'];
    super.onInit();
  }
}
// /$id
