import 'package:get/get.dart';
import 'package:triya_app/model/posted_job_res_model.dart';

class PrivateJobDetailController extends GetxController {
  final govJob = Rx<PostedJob?>(null);
  @override
  void onInit() {
    govJob.value = Get.arguments['private_job_data'];

    super.onInit();
  }
}
