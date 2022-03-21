import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/add_new_job_category_res_model.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/employe_home_controller.dart';
import 'package:triya_app/utils/date_formate_utils.dart';

class AddNewJobController extends GetxController {
  DateTime selectedDate = DateTime.now();
  DateTime select = DateTime.now();
  final formKey = GlobalKey<FormState>();
  final jobTitle = TextEditingController();
  final jobLink = TextEditingController();
  final qualification = TextEditingController();
  final jobDetails = TextEditingController();
  String? dropdownValue;
  final categoryListResponse = Rx<CategoryListResponse?>(null);

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  void getData() {
    getCategoryListData();
  }

  Future<void> addNewJob() async {
    if (formKey.currentState!.validate()) {
      final data = Dio.FormData.fromMap({
        'upload': await Dio.MultipartFile.fromFile(files.value!.path),
        'from_date': DateFormatUtils.ddMMyyyyFromDate(selectedDate),
        'to_date': DateFormatUtils.ddMMyyyyFromDate(select),
        'job_title': jobTitle.text,
        'job_link': jobLink.text,
        'qualification': qualification.text,
        'job_detail': jobDetails.text,
        'category_id': dropdownValue!
      });
      BaseApiService.instance
          .postForm(ServiceConstant.AddNewJob, data: data)
          .then((value) {
        final controller = Get.put(EmployerHomeController());

        controller.getData();
        Get.back();
      });
    }
  }

  Rx<File?> files = Rx<File?>(null);
  Future getPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      result.files.forEach((element) {
        files.value = File(element.path!);
      });
    }
  }

  void getCategoryListData() {
    BaseApiService.instance.get(ServiceConstant.categoryList).then((value) {
      CategoryListResponse response =
          CategoryListResponse.fromJson(value!.data);
      print(value.data);
      print(response.data);
      categoryListResponse.value = response;
      // print(response.data!.length);
    });
  }
}
