import 'package:get/get.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/basemodel/book_data_response.dart';
import 'package:triya_app/model/favorites_book_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class FavoritesBooksController extends GetxController {
  final bookFavoritesResponse = Rx<FavoritesBookUpdateResponse?>(null);
  @override
  void onReady() {
    super.onReady();
    getFavoritesBookData();
  }

  void getFavoritesBookData() {
    BaseApiService.instance
        .get(ServiceConstant.getFavoritesBookData)
        .then((value) {
      print(value);
      FavoritesBookUpdateResponse response =
          FavoritesBookUpdateResponse.fromJson(value!.data);
      print(response);
      bookFavoritesResponse.value = response;
      bookFavoritesResponse.refresh();
    });
  }

  void addToFavorite(int id, int index, int delete) {
    Map<String, dynamic> data = {
      'book_id': id,
    };
    if (delete != -1) {
      data = {
        'book_id': id,
        'id': delete,
      };
    }
    BaseApiService.instance
        .post(ServiceConstant.addBookToFavorite, data: data)
        .then((value) {
      if (delete != -1) {
        bookFavoritesResponse.value!.data![index].favoriteBook = null;
        getFavoritesBookData();
      } else {
        bookFavoritesResponse.value!.data![index].favoriteBook =
            FavoriteBook.fromJson(value!.data["data"]);
      }
      bookFavoritesResponse.refresh();
    }).onError((error, stackTrace) {});
  }
}
