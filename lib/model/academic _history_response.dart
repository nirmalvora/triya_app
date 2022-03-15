class AcademicHistoryResponse {
  bool? errors;
  Data? data;
  String? message;

  AcademicHistoryResponse({this.errors, this.data, this.message});

  AcademicHistoryResponse.fromJson(Map<String, dynamic> json) {
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
  String? schoolName;
  String? yeasOfPassing;
  String? sslSocre;
  String? secondaryDiploma;
  String? yearOfPassing;
  String? score;
  String? instituteName;
  String? fromDate;
  String? toDate;
  String? backlog;
  String? agregatedScore;
  String? gapBetweenEducation;
  String? reasonGapBetweenEducation;
  String? masterInsituteName;
  String? sepcialization;
  String? yearsOfCompletion;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.userId,
      this.schoolName,
      this.yeasOfPassing,
      this.sslSocre,
      this.secondaryDiploma,
      this.yearOfPassing,
      this.score,
      this.instituteName,
      this.fromDate,
      this.toDate,
      this.backlog,
      this.agregatedScore,
      this.gapBetweenEducation,
      this.reasonGapBetweenEducation,
      this.masterInsituteName,
      this.sepcialization,
      this.yearsOfCompletion,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    schoolName = json['school_name'];
    yeasOfPassing = json['yeas_of_passing'];
    sslSocre = json['ssl_socre'];
    secondaryDiploma = json['secondary_diploma'];
    yearOfPassing = json['year_of_passing'];
    score = json['score'];
    instituteName = json['institute_name'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    backlog = json['backlog'];
    agregatedScore = json['agregated_score'];
    gapBetweenEducation = json['gap_between_education'];
    reasonGapBetweenEducation = json['reason_gap_between_education'];
    masterInsituteName = json['master_insitute_name'];
    sepcialization = json['sepcialization'];
    yearsOfCompletion = json['years_of_completion'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['school_name'] = this.schoolName;
    data['yeas_of_passing'] = this.yeasOfPassing;
    data['ssl_socre'] = this.sslSocre;
    data['secondary_diploma'] = this.secondaryDiploma;
    data['year_of_passing'] = this.yearOfPassing;
    data['score'] = this.score;
    data['institute_name'] = this.instituteName;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['backlog'] = this.backlog;
    data['agregated_score'] = this.agregatedScore;
    data['gap_between_education'] = this.gapBetweenEducation;
    data['reason_gap_between_education'] = this.reasonGapBetweenEducation;
    data['master_insitute_name'] = this.masterInsituteName;
    data['sepcialization'] = this.sepcialization;
    data['years_of_completion'] = this.yearsOfCompletion;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
