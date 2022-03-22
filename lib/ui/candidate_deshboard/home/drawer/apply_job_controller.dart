import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/applied_jobs_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class AppliedJobController extends GetxController {
  final appliedJob = Rx<AppliedJobResponse?>(null);

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  void getData() {
    getAppliedJobData();
  }

  void getAppliedJobData() {
    BaseApiService.instance.get(ServiceConstant.appliedJob).then((value) {
      AppliedJobResponse response = AppliedJobResponse.fromJson(value!.data);
      print(value.data);
      print(response.data);
      appliedJob.value = response;
    });
  }
}
