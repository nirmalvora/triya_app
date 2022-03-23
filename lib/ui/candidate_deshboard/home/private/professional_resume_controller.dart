import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:triya_app/constants/api_constants.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/apply_job_res_model.dart';
import 'package:triya_app/model/resume_response_model.dart';
import 'package:triya_app/preference/preference_keys.dart';
import 'package:triya_app/preference/prerences.dart';
import 'package:triya_app/services/api_service_methods.dart';

class ProfileResumeController extends GetxController {
  Rx<ResumeResponseModel?> resumeResponse = Rx<ResumeResponseModel?>(null);
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

  final picker = ImagePicker();
  Rx<File?> image = Rx<File?>(null);
  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      sendFile(pickedFile);
      image.value = File(pickedFile.path);
    }
    image.refresh();
  }

  sendFile(file) async {
    var url = Uri.parse("${AppConfig.baseUrl}${ServiceConstant.uploadProfile}");
    var request = http.MultipartRequest("POST", url);
    Uint8List bytes = await file.readAsBytes();
    var accessToken =
        await Preferences.getString(PreferenceKeys.accessToken, "");

    request.headers['Authorization'] = 'Bearer $accessToken';
    List<int> _selectedFile = bytes;
    request.files.add(http.MultipartFile.fromBytes('image', _selectedFile,
        filename: "text_upload.txt"));
    request.send().then((response) {
      if (response.statusCode == 200) {
        getData();
      }
    });
  }

  void applyJob() {
    Map<String, dynamic> data = {'emp_id': jobId.value};
    BaseApiService.instance
        .post(ServiceConstant.applyJob, data: data)
        .then((value) {
      ApplyJobResModel response = ApplyJobResModel.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
