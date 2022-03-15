class SignUpResponse {
  bool? errors;
  SignUpData? data;
  String? message;

  SignUpResponse({this.errors, this.data, this.message});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    data = json['data'] != null ? new SignUpData.fromJson(json['data']) : null;
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

class SignUpData {
  String? email;
  String? loginType;
  String? firstName;
  String? lastName;
  String? mobile;
  int? roleId;
  String? socialId;
  String? profilePicture;
  String? updatedAt;
  String? createdAt;
  int? id;

  SignUpData(
      {this.email,
      this.loginType,
      this.firstName,
      this.lastName,
      this.mobile,
      this.roleId,
      this.socialId,
      this.profilePicture,
      this.updatedAt,
      this.createdAt,
      this.id});

  SignUpData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    loginType = json['login_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    roleId = json['role_id'];
    socialId = json['social_id'];
    profilePicture = json['profile_picture'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['login_type'] = this.loginType;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['role_id'] = this.roleId;
    data['social_id'] = this.socialId;
    data['profile_picture'] = this.profilePicture;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
