class GovJobResponse {
  bool? errors;
  List<GovData>? govData;
  String? message;

  GovJobResponse({this.errors, this.govData, this.message});

  GovJobResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['data'] != null) {
      govData = <GovData>[];
      json['data'].forEach((v) {
        govData!.add(new GovData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    if (this.govData != null) {
      data['data'] = this.govData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class GovData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<GovJobData>? government;

  GovData(
      {this.id, this.name, this.createdAt, this.updatedAt, this.government});

  GovData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['government'] != null) {
      government = <GovJobData>[];
      json['government'].forEach((v) {
        government!.add(new GovJobData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.government != null) {
      data['government'] = this.government!.map((v) => v.toJson()).toList();
    }
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
  String? scholarLink;
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
      this.scholarLink,
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
    scholarLink = json['link'];
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
    data['link'] = this.scholarLink;
    data['job_description'] = this.jobDescription;
    data['upload'] = this.upload;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['title'] = this.title;
    return data;
  }
}

class ScholerShipResponse {
  bool? errors;
  List<ScholarShipCat>? data;
  String? message;

  ScholerShipResponse({this.errors, this.data, this.message});

  ScholerShipResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['data'] != null) {
      data = <ScholarShipCat>[];
      json['data'].forEach((v) {
        data!.add(new ScholarShipCat.fromJson(v));
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

class ScholarShipCat {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<GovJobData>? scholarship;

  ScholarShipCat(
      {this.id, this.name, this.createdAt, this.updatedAt, this.scholarship});

  ScholarShipCat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['scholarship'] != null) {
      scholarship = <GovJobData>[];
      json['scholarship'].forEach((v) {
        scholarship!.add(new GovJobData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.scholarship != null) {
      data['scholarship'] = this.scholarship!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
