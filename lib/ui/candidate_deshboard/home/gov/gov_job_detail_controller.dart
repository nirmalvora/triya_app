import 'package:get/get.dart';
import 'package:triya_app/model/gov_job_model.dart';

class GovJobDetailCOntroller extends GetxController {
  final govJob = Rx<GovJobData?>(null);
  @override
  void onInit() {
    govJob.value = Get.arguments['gov_job_data'];

    super.onInit();
  }
}
