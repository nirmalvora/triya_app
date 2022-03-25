import 'package:get/get.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/apply_job_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class AppliedCandidateController extends GetxController {
  final applyJob = Rx<ApplyJobResponse?>(null);
  final loading = false.obs;
  final jobId = 0.obs;
  final searchText = "".obs;

  @override
  void onReady() {
    super.onReady();
    final res = Get.arguments;
    if (res != null) {
      jobId.value = res[AppConstants.jobID];
    }
    getApplyJob();
  }

  void getApplyJob() {
    BaseApiService.instance
        .get("${ServiceConstant.getApplyJob}/${jobId.value}")
        .then((value) {
      ApplyJobResponse response = ApplyJobResponse.fromJson(value!.data);
      applyJob.value = response;
      applyJob.refresh();
    });
  }
}
