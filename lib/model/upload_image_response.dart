class UploadImageResponse {
  bool? errors;
  String? data;
  String? message;

  UploadImageResponse({this.errors, this.data, this.message});

  UploadImageResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}
