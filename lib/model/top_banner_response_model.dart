class TopBannerResponse {
  bool? errors;
  List<TopBannerData>? data;
  String? message;

  TopBannerResponse({this.errors, this.data, this.message});

  TopBannerResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['data'] != null) {
      data = <TopBannerData>[];
      json['data'].forEach((v) {
        data!.add(new TopBannerData.fromJson(v));
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

class TopBannerData {
  int? id;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;

  TopBannerData(
      {this.id, this.image, this.status, this.createdAt, this.updatedAt});

  TopBannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
