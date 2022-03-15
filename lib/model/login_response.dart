class LoginResponse {
  bool? errors;
  LoginData? data;
  String? message;

  LoginResponse({this.errors, this.data, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
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

class LoginData {
  String? token;
  User? user;

  LoginData({this.token, this.user});

  LoginData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? socialId;
  String? profilePicture;
  String? companyName;
  String? officeNo;
  String? area;
  String? country;
  String? state;
  String? city;
  String? emailVerifiedAt;
  String? loginType;
  String? createdAt;
  String? updatedAt;
  int? roleId;

  User(
      {this.id,
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
      this.createdAt,
      this.updatedAt,
      this.roleId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['role_id'] = this.roleId;
    return data;
  }
}
