import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/gov_job_model.dart';
import 'package:triya_app/services/api_service_methods.dart';

class ScholarshipJobController extends GetxController {
  final govJobResponse = Rx<ScholerShipResponse?>(null);
  final loading = false.obs;
  final searchText = "".obs;
  @override
  void onReady() {
    super.onReady();
    getJobList();
  }

  void getJobList() {
    loading.value = true;
    BaseApiService.instance.get(ServiceConstant.getScholarJob).then((value) {
      ScholerShipResponse response = ScholerShipResponse.fromJson(value!.data);
      loading.value = false;
      govJobResponse.value = response;
      govJobResponse.refresh();
    }).onError((error, stackTrace) {
      loading.value = false;
    });
  }
}
