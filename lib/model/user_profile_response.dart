import 'package:triya_app/model/login_response.dart';

class UserProfileResponse {
  bool? errors;
  User? data;
  String? message;

  UserProfileResponse({this.errors, this.data, this.message});

  UserProfileResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
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
