import 'package:get/get.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/resume_response_model.dart';
import 'package:triya_app/services/api_service_methods.dart';

class ResumeViewController extends GetxController {
  Rx<ResumeResponseModel?> resumeResponse = Rx<ResumeResponseModel?>(null);
  final isPreview = false.obs;
  @override
  void onReady() {
    super.onReady();
    isPreview.value = Get.arguments?[AppConstants.isPreview] ?? false;
    getData();
  }

  void getData() {
    BaseApiService.instance.get(ServiceConstant.getResume).then((value) {
      ResumeResponseModel responseModel =
          ResumeResponseModel.fromJson(value!.data);
      resumeResponse.value = responseModel;
      resumeResponse.refresh();
    });
  }
}
