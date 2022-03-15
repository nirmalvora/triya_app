class PersonalStatementResponse {
  bool? errors;
  PersonalStatementData? data;
  String? message;

  PersonalStatementResponse({this.errors, this.data, this.message});

  PersonalStatementResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    data = json['data'] != null
        ? new PersonalStatementData.fromJson(json['data'])
        : null;
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

class PersonalStatementData {
  String? text;

  PersonalStatementData({this.text});

  PersonalStatementData.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}
