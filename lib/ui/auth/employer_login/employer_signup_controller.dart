import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:triya_app/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/candidate_sign_up_response.dart';
import 'package:triya_app/preference/preference_keys.dart';
import 'package:triya_app/preference/prerences.dart';
import 'package:triya_app/services/api_service_methods.dart';

class EmployerSignUpController extends GetxController {
  Rx<CandidateSignUpResponse?> candidateLogo =
      Rx<CandidateSignUpResponse?>(null);
  String? countryValue;
  String? stateValue;
  String? cityValue;
  File? file;
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final companyName = TextEditingController();
  final email = TextEditingController();
  final mobileNo = TextEditingController();
  final officeNo = TextEditingController();
  final area = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    signup();
  }

  void signup() {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> employerData = {
        'company_logo': file,
        'first_name': firstName.text,
        'last_name': lastName.text,
        'company_name': companyName.text,
        'email': email.text,
        'mobile': mobileNo.text,
        'office_no': officeNo.text,
        'area': area.text,
        'country': countryValue,
        'state': stateValue,
        'city': cityValue,
        'password': password.text,
        'confirm_password': confirmPassword.text,
      };
      BaseApiService.instance
          .post(ServiceConstant.employerCandidate, data: employerData)
          .then((value) {
        CandidateSignUpResponse response =
            CandidateSignUpResponse.fromJson(value!.data);
        candidateLogo.value = response;
        candidateLogo.refresh();
      });
    }
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
        signup();
      }
    });
  }
}
