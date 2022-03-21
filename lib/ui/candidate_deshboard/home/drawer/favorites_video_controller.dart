import 'package:get/get.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/basemodel/book_data_response.dart';
import 'package:triya_app/model/favorites_video_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class FavoritesVideoController extends GetxController {
  final videoDataResponse = Rx<FavoritesVideoResponse?>(null);
  @override
  void onReady() {
    super.onReady();
    getFavoritesVideoData();
  }

  void getFavoritesVideoData() {
    BaseApiService.instance
        .get(ServiceConstant.getFavoritesVideoData)
        .then((value) {
      print(value);
      FavoritesVideoResponse response =
          FavoritesVideoResponse.fromJson(value!.data);
      print(response);
      videoDataResponse.value = response;
      videoDataResponse.refresh();
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
        getFavoritesVideoData();
      } else {
        videoDataResponse.value!.data![index].favoriteBook =
            FavoriteBook.fromJson(value!.data["data"]);
      }
      videoDataResponse.refresh();
    }).onError((error, stackTrace) {});
  }
}
