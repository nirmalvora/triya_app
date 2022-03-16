class GovJobResponse {
  bool? errors;
  List<GovJobData>? data;
  String? message;

  GovJobResponse({this.errors, this.data, this.message});

  GovJobResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['data'] != null) {
      data = <GovJobData>[];
      json['data'].forEach((v) {
        data!.add(new GovJobData.fromJson(v));
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

class GovJobData {
  int? id;
  String? postDate;
  String? lastDate;
  String? qualification;
  String? board;
  String? jobLink;
  String? jobDescription;
  String? upload;
  String? createdAt;
  String? updatedAt;
  String? title;

  GovJobData(
      {this.id,
      this.postDate,
      this.lastDate,
      this.qualification,
      this.board,
      this.jobLink,
      this.jobDescription,
      this.upload,
      this.createdAt,
      this.title,
      this.updatedAt});

  GovJobData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postDate = json['post_date'];
    lastDate = json['last_date'];
    qualification = json['qualification'];
    board = json['board'];
    jobLink = json['job_link'];
    jobDescription = json['job_description'];
    upload = json['upload'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_date'] = this.postDate;
    data['last_date'] = this.lastDate;
    data['qualification'] = this.qualification;
    data['board'] = this.board;
    data['job_link'] = this.jobLink;
    data['job_description'] = this.jobDescription;
    data['upload'] = this.upload;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['title'] = this.title;
    return data;
  }
}
