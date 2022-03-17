class PostedJobResModel {
  bool? errors;
  List<PostedJob>? data;
  String? message;

  PostedJobResModel({this.errors, this.data, this.message});

  PostedJobResModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['data'] != null) {
      data = <PostedJob>[];
      json['data'].forEach((v) {
        data!.add(new PostedJob.fromJson(v));
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

class PostedJob {
  int? id;
  String? jobTitle;
  String? jobLink;
  String? qualification;
  String? jobDetail;
  String? upload;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? fromDate;
  String? toDate;

  PostedJob(
      {this.id,
      this.jobTitle,
      this.jobLink,
      this.qualification,
      this.jobDetail,
      this.upload,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.fromDate,
      this.toDate});

  PostedJob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitle = json['job_title'];
    jobLink = json['job_link'];
    qualification = json['qualification'];
    jobDetail = json['job_detail'];
    upload = json['upload'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_title'] = this.jobTitle;
    data['job_link'] = this.jobLink;
    data['qualification'] = this.qualification;
    data['job_detail'] = this.jobDetail;
    data['upload'] = this.upload;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    return data;
  }
}
