import 'package:triya_app/model/basemodel/book_data_response.dart';

class FavoritesVideoResponse {
  bool? errors;
  List<FavoritesVideo>? data;
  String? message;

  FavoritesVideoResponse({this.errors, this.data, this.message});

  FavoritesVideoResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['data'] != null) {
      data = <FavoritesVideo>[];
      json['data'].forEach((v) {
        data!.add(new FavoritesVideo.fromJson(v));
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

class FavoritesVideo {
  int? id;
  String? title;
  String? url;
  String? videoCategoryId;
  String? createdAt;
  String? updatedAt;
  FavoriteBook? favoriteBook;

  FavoritesVideo(
      {this.id,
      this.title,
      this.url,
      this.videoCategoryId,
      this.createdAt,
      this.updatedAt,
      this.favoriteBook});

  FavoritesVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    videoCategoryId = json['video_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    favoriteBook = json['favorite_video'] != null
        ? new FavoriteBook.fromJson(json['favorite_video'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['video_category_id'] = this.videoCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.favoriteBook != null) {
      data['favorite_video'] = this.favoriteBook!.toJson();
    }
    return data;
  }
}
