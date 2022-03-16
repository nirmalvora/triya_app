class BookCategoryResponse {
  bool? errors;
  List<BookCategoryData>? data;
  String? message;

  BookCategoryResponse({this.errors, this.data, this.message});

  BookCategoryResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['data'] != null) {
      data = <BookCategoryData>[];
      json['data'].forEach((v) {
        data!.add(new BookCategoryData.fromJson(v));
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

class BookCategoryData {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  BookCategoryData(
      {this.id, this.name, this.createdAt, this.updatedAt, this.image});

  BookCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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
