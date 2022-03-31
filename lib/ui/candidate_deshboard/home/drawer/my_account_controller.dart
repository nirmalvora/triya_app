import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:triya_app/constants/api_constants.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/local_data/app_state.dart';
import 'package:triya_app/model/login_response.dart';
import 'package:triya_app/model/name_update_response.dart';
import 'package:triya_app/model/user_profile_response.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/preference/preference_keys.dart';
import 'package:triya_app/preference/prerences.dart';
import 'package:triya_app/services/api_service_methods.dart';

class MyAccountController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onReady() {
    super.onReady();
    getImageData();
  }

  void getImageData() {
    BaseApiService.instance
        .get(ServiceConstant.getProfilePicture)
        .then((value) {
      UserProfileResponse responseModel =
          UserProfileResponse.fromJson(value!.data);
      AppState.loginData.value!.user = responseModel.data!;
      AppState.loginData.refresh();
      Preferences.setString(PreferenceKeys.userProfile,
          jsonEncode(LoginResponse(data: AppState.loginData.value).toJson()));
    });
  }

  void updateData() {
    Map<String, dynamic> update = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.updateName, data: update)
        .then((value) {
      print(value!.data);

      NameUpdateResponse response = NameUpdateResponse.fromJson(value.data);
      AppState.loginData.value?.user!.firstName = response.data!.firstName;
      AppState.loginData.value?.user!.lastName = response.data!.lastName;
      Preferences.setString(PreferenceKeys.userProfile,
          jsonEncode(LoginResponse(data: AppState.loginData.value).toJson()));
      AppState.loginData.refresh();
      Get.snackbar(response.message!, "");
    });
  }

  void removeUser() {
    Get.offAllNamed(NavigationName.loginTypePage);
    Preferences.clear();
  }

  final picker = ImagePicker();
  Rx<File?> image = Rx<File?>(null);
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      sendFile(pickedFile);
      image.value = File(pickedFile.path);
    }
    image.refresh();
  }

  sendFile(file) async {
    var url = Uri.parse(
        "${AppConfig.baseUrl}${ServiceConstant.uploadProfilePicture}");
    var request = http.MultipartRequest("POST", url);
    Uint8List bytes = await file.readAsBytes();
    var accessToken =
        await Preferences.getString(PreferenceKeys.accessToken, "");

    request.headers['Authorization'] = 'Bearer $accessToken';
    List<int> _selectedFile = bytes;
    request.files.add(http.MultipartFile.fromBytes(
        'profile_picture', _selectedFile,
        filename: "text_upload.txt"));
    request.send().then((response) {
      if (response.statusCode == 200) {
        getImageData();
      }
    });
  }
}
