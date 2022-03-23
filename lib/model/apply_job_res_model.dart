class ApplyJobResModel {
  bool? errors;
  ApplyJobData? data;
  String? message;

  ApplyJobResModel({this.errors, this.data, this.message});

  ApplyJobResModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    data = json['data'] != null ? ApplyJobData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class ApplyJobData {
  dynamic? empId;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  ApplyJobData(
      {this.empId, this.userId, this.updatedAt, this.createdAt, this.id});

  ApplyJobData.fromJson(Map<String, dynamic> json) {
    empId = json['emp_id'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_id'] = this.empId;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
