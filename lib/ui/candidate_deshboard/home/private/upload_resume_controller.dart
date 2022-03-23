import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/apply_job_res_model.dart';
import 'package:triya_app/services/api_service_methods.dart';

class UploadResumeController extends GetxController {
  Rx<File?> files = Rx<File?>(null);
  final jobId = 0.obs;

  @override
  void onReady() {
    super.onReady();
    final res = Get.arguments;
    if (res != null) {
      jobId.value = res[AppConstants.jobID] ?? -1;
    }
  }

  Future getPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      result.files.forEach((element) {
        files.value = File(element.path!);
        files.refresh();
      });
    }
  }

  Future<void> applyJob() async {
    Dio.MultipartFile file =
        await Dio.MultipartFile.fromFile(files.value!.path);
    final data = {
      'upload': file,
      'emp_id': jobId.value,
    };
    final formData = Dio.FormData.fromMap(data);
    BaseApiService.instance
        .postForm(ServiceConstant.applyJob, data: formData)
        .then((value) {
      ApplyJobResModel response = ApplyJobResModel.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
