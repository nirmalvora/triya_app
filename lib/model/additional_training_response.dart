class AdditionalTrainingResponse {
  bool? errors;
  Data? data;
  String? message;

  AdditionalTrainingResponse({this.errors, this.data, this.message});

  AdditionalTrainingResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? userId;
  String? companyName;
  String? secialization;
  String? description;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.userId,
      this.companyName,
      this.secialization,
      this.description,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    companyName = json['company_name'];
    secialization = json['secialization'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['company_name'] = this.companyName;
    data['secialization'] = this.secialization;
    data['description'] = this.description;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
