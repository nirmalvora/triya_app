import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/apply_job_response.dart';
import 'package:triya_app/model/posted_job_res_model.dart';
import 'package:triya_app/services/api_service_methods.dart';

class EmployerHomeController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final postedJobResponse = Rx<PostedJobResModel?>(null);

  final loading = false.obs;

  final searchText = "".obs;

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  void getData() {
    getTopBannerData();
  }

  void getTopBannerData() {
    BaseApiService.instance.get(ServiceConstant.PostedJob).then((value) {
      PostedJobResModel response = PostedJobResModel.fromJson(value!.data);
      postedJobResponse.value = response;
      postedJobResponse.refresh();
      print(postedJobResponse.value!.data!.length);
    });
  }
}
