import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/add_new_job_category_res_model.dart';
import 'package:triya_app/model/gov_job_model.dart';
import 'package:triya_app/services/api_service_methods.dart';

class GovJobDetailController extends GetxController {
  final govJob = Rx<GovJobData?>(null);
  final categoryListResponse = Rx<CategoryListResponse?>(null);
  @override
  void onReady() {
    super.onReady();
    getData();
  }

  void getData() {
    getCategoryListData();
  }

  @override
  void onInit() {
    govJob.value = Get.arguments['gov_job_data'];
    super.onInit();
  }

  void getCategoryListData() {
    BaseApiService.instance.get(ServiceConstant.categoryList).then((value) {
      CategoryListResponse response =
          CategoryListResponse.fromJson(value!.data);
      categoryListResponse.value = response;
      // print(response.data!.length);
    });
  }
}
