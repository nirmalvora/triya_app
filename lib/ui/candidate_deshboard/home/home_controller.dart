import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/book_category_response.dart';
import 'package:triya_app/model/top_banner_response_model.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/preference/prerences.dart';
import 'package:triya_app/services/api_service_methods.dart';

class HomeController extends GetxController {
  final topBannerResponse = Rx<TopBannerResponse?>(null);
  final bottomBannerResponse = Rx<TopBannerResponse?>(null);
  final bookCategoryResponse = Rx<BookCategoryResponse?>(null);
  final videoCategoryResponse = Rx<BookCategoryResponse?>(null);
  final searchText = "".obs;
  int selected = 0;
  @override
  void onReady() {
    super.onReady();
    getData();
  }

  void getData() {
    getTopBannerData();
    getBottomBannerData();
    getBookCategoryData();
    getVideoCategoryData();
  }

  void getTopBannerData() {
    BaseApiService.instance.get(ServiceConstant.getTopBanner).then((value) {
      TopBannerResponse response = TopBannerResponse.fromJson(value!.data);
      topBannerResponse.value = response;
      // print(response.data!.length);
    });
  }

  void getBottomBannerData() {
    BaseApiService.instance.get(ServiceConstant.getBottomBanner).then((value) {
      TopBannerResponse response = TopBannerResponse.fromJson(value!.data);
      bottomBannerResponse.value = response;
      // print(response.data!.length);
    });
  }

  void getBookCategoryData() {
    BaseApiService.instance.get(ServiceConstant.getBookCategory).then((value) {
      BookCategoryResponse response =
          BookCategoryResponse.fromJson(value!.data);
      bookCategoryResponse.value = response;
    });
  }

  void getVideoCategoryData() {
    BaseApiService.instance.get(ServiceConstant.getVideoCategory).then((value) {
      BookCategoryResponse response =
          BookCategoryResponse.fromJson(value!.data);
      videoCategoryResponse.value = response;
    });
  }

  void removeUser() {
    Get.offAllNamed(NavigationName.loginTypePage);
    Preferences.clear();
  }
}
