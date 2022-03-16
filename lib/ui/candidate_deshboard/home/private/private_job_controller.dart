import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/services/api_service_methods.dart';

import '../../../../model/gov_job_model.dart';

class PrivateJobController extends GetxController {
  final govJobResponse = Rx<GovJobResponse?>(null);
  final loading = false.obs;
  @override
  void onReady() {
    super.onReady();
    getJobList();
  }

  void getJobList() {
    loading.value = true;
    BaseApiService.instance.get(ServiceConstant.getPrivateJob).then((value) {
      print(value);
      GovJobResponse response = GovJobResponse.fromJson(value!.data);
      loading.value = false;
      govJobResponse.value = response;
      govJobResponse.refresh();
    }).onError((error, stackTrace) {
      loading.value = false;
    });
  }
}
