import 'package:get/get.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/resume_response_model.dart';
import 'package:triya_app/services/api_service_methods.dart';

class ResumeViewController extends GetxController {
  Rx<ResumeResponseModel?> resumeResponse = Rx<ResumeResponseModel?>(null);
  final isPreview = false.obs;
  final userId = 0.obs;
  @override
  void onReady() {
    super.onReady();
    isPreview.value = Get.arguments?[AppConstants.isPreview] ?? false;
    userId.value = Get.arguments?[AppConstants.userId] ?? 0;
    print(userId.value);
    getData();
  }

  void getData() {
    if (userId.value != 0) {
      BaseApiService.instance
          .get("${ServiceConstant.getResumeOne}/${userId.value}")
          .then((value) {
        ResumeResponseModel responseModel =
            ResumeResponseModel.fromJson(value!.data);
        resumeResponse.value = responseModel;
        resumeResponse.refresh();
      });
    } else {
      BaseApiService.instance.get(ServiceConstant.getResume).then((value) {
        ResumeResponseModel responseModel =
            ResumeResponseModel.fromJson(value!.data);
        resumeResponse.value = responseModel;
        resumeResponse.refresh();
      });
    }
  }
}
