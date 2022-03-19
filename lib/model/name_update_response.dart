class NameUpdateResponse {
  bool? errors;
  Data? data;
  String? message;

  NameUpdateResponse({this.errors, this.data, this.message});

  NameUpdateResponse.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;

  Data({this.firstName, this.lastName});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
