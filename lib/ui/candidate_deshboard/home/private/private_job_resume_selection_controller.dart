import 'package:get/get.dart';
import 'package:triya_app/constants/app_constants.dart';

class PrivateJobResumeSelectionController extends GetxController {
  final showApplyButton = false.obs;
  final jobId = 0.obs;

  @override
  void onReady() {
    super.onReady();
    final res = Get.arguments;
    if (res != null) {
      showApplyButton.value = res[AppConstants.showApplyButton] ?? false;
      jobId.value = res[AppConstants.jobID] ?? -1;
    }
  }
}
