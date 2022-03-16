import 'package:get/get.dart';
import 'package:triya_app/model/gov_job_model.dart';

class PrivateJobDetailController extends GetxController {
  final govJob = Rx<GovJobData?>(null);
  @override
  void onInit() {
    govJob.value = Get.arguments['private_job_data'];

    super.onInit();
  }
}
