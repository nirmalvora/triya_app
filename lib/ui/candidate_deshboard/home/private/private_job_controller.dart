import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/private_job_response_model.dart';
import 'package:triya_app/services/api_service_methods.dart';

class PrivateJobController extends GetxController {
  final privateJobResponse = Rx<PostedJobResModel?>(null);
  final loading = false.obs;
  final searchText = "".obs;
  @override
  void onReady() {
    super.onReady();
    getJobList();
  }

  void getJobList() {
    loading.value = true;
    BaseApiService.instance.get(ServiceConstant.getPrivateJob).then((value) {
      PostedJobResModel response = PostedJobResModel.fromJson(value!.data);
      loading.value = false;
      privateJobResponse.value = response;
      privateJobResponse.refresh();
      refresh();
    }).onError((error, stackTrace) {
      loading.value = false;
    });
  }
}
