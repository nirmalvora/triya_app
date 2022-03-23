class AppliedJobResponse {
  bool? errors;
  List<AppliedJob>? data;
  String? message;

  AppliedJobResponse({this.errors, this.data, this.message});

  AppliedJobResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['data'] != null) {
      data = <AppliedJob>[];
      json['data'].forEach((v) {
        data!.add(new AppliedJob.fromJson(v));
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

class AppliedJob {
  int? id;
  int? categoryId;
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
  List<PrivateJobs>? privateJobs;

  AppliedJob(
      {this.id,
      this.categoryId,
      this.jobTitle,
      this.jobLink,
      this.qualification,
      this.jobDetail,
      this.upload,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.fromDate,
      this.toDate,
      this.privateJobs});

  AppliedJob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
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
    if (json['private_jobs'] != null) {
      privateJobs = <PrivateJobs>[];
      json['private_jobs'].forEach((v) {
        privateJobs!.add(new PrivateJobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
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
    if (this.privateJobs != null) {
      data['private_jobs'] = this.privateJobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrivateJobs {
  int? id;
  int? userId;
  int? empId;
  String? upload;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? socialId;
  String? profilePicture;
  Null? companyName;
  Null? officeNo;
  Null? area;
  Null? country;
  Null? state;
  Null? city;
  Null? emailVerifiedAt;
  String? loginType;
  String? password;
  int? isApproved;
  Null? rememberToken;
  int? roleId;

  PrivateJobs(
      {this.id,
      this.userId,
      this.empId,
      this.upload,
      this.createdAt,
      this.updatedAt,
      this.email,
      this.firstName,
      this.lastName,
      this.mobile,
      this.socialId,
      this.profilePicture,
      this.companyName,
      this.officeNo,
      this.area,
      this.country,
      this.state,
      this.city,
      this.emailVerifiedAt,
      this.loginType,
      this.password,
      this.isApproved,
      this.rememberToken,
      this.roleId});

  PrivateJobs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    empId = json['emp_id'];
    upload = json['upload'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    socialId = json['social_id'];
    profilePicture = json['profile_picture'];
    companyName = json['company_name'];
    officeNo = json['office_no'];
    area = json['area'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    emailVerifiedAt = json['email_verified_at'];
    loginType = json['login_type'];
    password = json['password'];
    isApproved = json['is_approved'];
    rememberToken = json['remember_token'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['emp_id'] = this.empId;
    data['upload'] = this.upload;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['social_id'] = this.socialId;
    data['profile_picture'] = this.profilePicture;
    data['company_name'] = this.companyName;
    data['office_no'] = this.officeNo;
    data['area'] = this.area;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['login_type'] = this.loginType;
    data['password'] = this.password;
    data['is_approved'] = this.isApproved;
    data['remember_token'] = this.rememberToken;
    data['role_id'] = this.roleId;
    return data;
  }
}
