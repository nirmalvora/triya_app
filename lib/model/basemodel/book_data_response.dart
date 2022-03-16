class BookDataResponse {
  bool? errors;
  List<BookInData>? data;
  String? message;

  BookDataResponse({this.errors, this.data, this.message});

  BookDataResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['data'] != null) {
      data = <BookInData>[];
      json['data'].forEach((v) {
        data!.add(BookInData.fromJson(v));
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

class BookInData {
  int? id;
  String? title;
  String? url;
  String? bookCategoryId;
  String? createdAt;
  String? updatedAt;
  FavoriteBook? favoriteBook;

  BookInData(
      {this.id,
      this.title,
      this.url,
      this.bookCategoryId,
      this.createdAt,
      this.updatedAt,
      this.favoriteBook});

  BookInData.fromJson(Map<String, dynamic> json) {
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
    data['favorite_book'] = this.favoriteBook;
    return data;
  }
}

class FavoriteBook {
  int? id;
  int? bookId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  FavoriteBook(
      {this.id, this.bookId, this.userId, this.createdAt, this.updatedAt});

  FavoriteBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['book_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['book_id'] = this.bookId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
