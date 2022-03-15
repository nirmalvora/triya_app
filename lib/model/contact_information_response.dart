class ContactInformationResponse {
  bool? errors;
  Data? data;
  String? message;

  ContactInformationResponse({this.errors, this.data, this.message});

  ContactInformationResponse.fromJson(Map<String, dynamic> json) {
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
  String? mobileNo;
  String? email;
  String? houseNo;
  String? area;
  String? city;
  String? state;
  String? pinCode;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.userId,
      this.mobileNo,
      this.email,
      this.houseNo,
      this.area,
      this.city,
      this.state,
      this.pinCode,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    houseNo = json['house_no'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    pinCode = json['pin_code'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['house_no'] = this.houseNo;
    data['area'] = this.area;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pin_code'] = this.pinCode;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
