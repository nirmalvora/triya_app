import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/basemodel/book_data_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class VideoController extends GetxController {
  final videoDataResponse = Rx<BookDataResponse?>(null);
  final loading = false.obs;
  @override
  void onReady() {
    super.onReady();
    final res = Get.arguments;
    int id = res[AppConstants.bookCategoryId];
    getData(id);
  }

  void getData(int id) {
    loading.value = true;
    BaseApiService.instance
        .get("${ServiceConstant.getVideoData}$id")
        .then((value) {
      loading.value = false;
      print(value);
      BookDataResponse response = BookDataResponse.fromJson(value!.data);
      print(response);
      videoDataResponse.value = response;
      videoDataResponse.refresh();
    }).onError((error, stackTrace) {
      loading.value = false;
    });
  }

  void addToFavotite(int id, int index, int delete) {
    Map<String, dynamic> data = {
      'video_id': id,
    };
    if (delete != -1) {
      data = {
        'video_id': id,
        'id': delete,
      };
    }
    BaseApiService.instance
        .post(ServiceConstant.addVideoToFavorite, data: data)
        .then((value) {
      if (delete != -1) {
        videoDataResponse.value!.data![index].favoriteBook = null;
        print(videoDataResponse.value!.data![index].favoriteBook);
      } else {
        videoDataResponse.value!.data![index].favoriteBook =
            FavoriteBook.fromJson(value!.data["data"]);
      }
      videoDataResponse.refresh();
    }).onError((error, stackTrace) {});
  }
}
