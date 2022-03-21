import 'package:triya_app/model/basemodel/book_data_response.dart';

class FavoritesBookResponse {
  bool? errors;
  List<updateData>? data;
  String? message;

  FavoritesBookResponse({this.errors, this.data, this.message});

  FavoritesBookResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['data'] != null) {
      data = <updateData>[];
      json['data'].forEach((v) {
        data!.add(new updateData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class updateData {
  int? id;
  String? title;
  String? url;
  String? bookCategoryId;
  String? createdAt;
  String? updatedAt;
  FavoriteBook? favoriteBook;

  updateData(
      {this.id,
      this.title,
      this.url,
      this.bookCategoryId,
      this.createdAt,
      this.updatedAt,
      this.favoriteBook});

  updateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    bookCategoryId = json['book_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    favoriteBook = json['favorite_book'] != null
        ? new FavoriteBook.fromJson(json['favorite_book'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['book_category_id'] = this.bookCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.favoriteBook != null) {
      data['favorite_book'] = this.favoriteBook!.toJson();
    }
    return data;
  }
}
