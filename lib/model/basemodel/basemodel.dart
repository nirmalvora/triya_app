class BaseModel {
  BaseModel({
    this.status,
    this.code,
    this.message,
    this.detail,
  });

  String? status;
  int? code;
  String? message;
  String? detail;

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "detail": detail,
      };
}
