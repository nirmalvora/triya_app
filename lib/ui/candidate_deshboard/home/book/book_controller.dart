import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:triya_app/constants/app_constants.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/basemodel/book_data_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class BookController extends GetxController {
  final bookDataResponse = Rx<BookDataResponse?>(null);
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
        .get("${ServiceConstant.getBookData}$id")
        .then((value) {
      loading.value = false;
      print(value);
      BookDataResponse response = BookDataResponse.fromJson(value!.data);
      print(response);
      bookDataResponse.value = response;
      bookDataResponse.refresh();
    }).onError((error, stackTrace) {
      loading.value = false;
    });
  }

  void addToFavotite(int id, int index, int delete) {
    Map<String, dynamic> data = {
      'book_id': id,
    };
    if (id != -1) {
      data = {
        'book_id': id,
        'id': delete,
      };
    }
    BaseApiService.instance
        .post(ServiceConstant.addBookToFavorite, data: data)
        .then((value) {
      print(FavoriteBook.fromJson(value!.data["data"]).toJson());
      if (delete != -1) {
        bookDataResponse.value!.data!.data![index].favoriteBook = null;
      } else {
        bookDataResponse.value!.data!.data![index].favoriteBook =
            FavoriteBook.fromJson(value.data["data"]);
      }
      bookDataResponse.refresh();
    }).onError((error, stackTrace) {});
  }
}
