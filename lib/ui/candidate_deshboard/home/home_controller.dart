import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/top_banner_response_model.dart';
import 'package:triya_app/services/api_service_methods.dart';

class HomeController extends GetxController {
  final topBannerResponse = Rx<TopBannerResponse?>(null);
  @override
  void onReady() {
    super.onReady();
    getData();
  }

  void getData() {
    getTopBannerData();
  }

  void getTopBannerData() {
    BaseApiService.instance.get(ServiceConstant.getTopBanner).then((value) {
      TopBannerResponse response = TopBannerResponse.fromJson(value!.data);
      topBannerResponse.value = response;
      print(response.data!.length);
    });
  }
}
