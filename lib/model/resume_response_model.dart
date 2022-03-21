class ResumeResponseModel {
  bool? errors;
  List<ResumeData>? resumeData;
  String? message;

  ResumeResponseModel({this.errors, this.resumeData, this.message});

  ResumeResponseModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['data'] != null) {
      resumeData = <ResumeData>[];
      json['data'].forEach((v) {
        resumeData!.add(ResumeData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['errors'] = errors;
    if (resumeData != null) {
      data['data'] = resumeData!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ResumeData {
  int? id;
  int? userId;
  String? tellSomethingAboutYou;
  String? createdAt;
  String? updatedAt;
  ResumeAcademicHistories? resumeAcademicHistories;
  ResumeConcactInformation? resumeConcactInformation;
  ResumeAdditionalTrains? resumeAdditionalTrains;
  ResumeConferenceAttendeds? resumeConferenceAttendeds;
  ResumeIndustryAwards? resumeIndustryAwards;
  ResumeKeySkills? resumeKeySkills;
  Resume? resume;
  ResumeProfessionalAffiliations? resumeProfessionalAffiliations;
  ResumeProfessionalAffiliations? resumeProfessionalCertifications;
  ResumeProfessionalExperiences? resumeProfessionalExperiences;
  ResumeProfessionalAffiliations? resumePublications;

  ResumeData(
      {this.id,
      this.userId,
      this.tellSomethingAboutYou,
      this.createdAt,
      this.updatedAt,
      this.resumeAcademicHistories,
      this.resumeAdditionalTrains,
      this.resumeConcactInformation,
      this.resumeConferenceAttendeds,
      this.resumeIndustryAwards,
      this.resumeKeySkills,
      this.resume,
      this.resumeProfessionalAffiliations,
      this.resumeProfessionalCertifications,
      this.resumeProfessionalExperiences,
      this.resumePublications});

  ResumeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tellSomethingAboutYou = json['tell_something_about_you'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    resumeAcademicHistories = json['resume_academic_histories'] != null
        ? ResumeAcademicHistories.fromJson(json['resume_academic_histories'])
        : null;
    resumeAdditionalTrains = json['resume_additional_trains'] != null
        ? ResumeAdditionalTrains.fromJson(json['resume_additional_trains'])
        : null;
    resumeConcactInformation = json['resume_concact_information'] != null
        ? ResumeConcactInformation.fromJson(json['resume_concact_information'])
        : null;
    resumeConferenceAttendeds = json['resume_conference_attendeds'] != null
        ? ResumeConferenceAttendeds.fromJson(
            json['resume_conference_attendeds'])
        : null;
    resumeIndustryAwards = json['resume_industry_awards'] != null
        ? ResumeIndustryAwards.fromJson(json['resume_industry_awards'])
        : null;
    resumeKeySkills = json['resume_key_skills'] != null
        ? ResumeKeySkills.fromJson(json['resume_key_skills'])
        : null;
    resume = json['resume'] != null ? Resume.fromJson(json['resume']) : null;
    resumeProfessionalAffiliations =
        json['resume_professional_affiliations'] != null
            ? ResumeProfessionalAffiliations.fromJson(
                json['resume_professional_affiliations'])
            : null;
    resumeProfessionalCertifications =
        json['resume_professional_certifications'] != null
            ? ResumeProfessionalAffiliations.fromJson(
                json['resume_professional_certifications'])
            : null;
    resumeProfessionalExperiences =
        json['resume_professional_experiences'] != null
            ? ResumeProfessionalExperiences.fromJson(
                json['resume_professional_experiences'])
            : null;
    resumePublications = json['resume_publications'] != null
        ? ResumeProfessionalAffiliations.fromJson(json['resume_publications'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['tell_something_about_you'] = tellSomethingAboutYou;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (resumeAcademicHistories != null) {
      data['resume_academic_histories'] =
          this.resumeAcademicHistories!.toJson();
    }
    if (resumeAdditionalTrains != null) {
      data['resume_additional_trains'] = resumeAdditionalTrains!.toJson();
    }
    if (resumeConcactInformation != null) {
      data['resume_concact_information'] =
          this.resumeConcactInformation!.toJson();
    }
    if (resumeConferenceAttendeds != null) {
      data['resume_conference_attendeds'] =
          this.resumeConferenceAttendeds!.toJson();
    }
    if (resumeIndustryAwards != null) {
      data['resume_industry_awards'] = resumeIndustryAwards!.toJson();
    }
    if (resumeKeySkills != null) {
      data['resume_key_skills'] = resumeKeySkills!.toJson();
    }
    if (resume != null) {
      data['resume'] = resume!.toJson();
    }
    if (resumeProfessionalAffiliations != null) {
      data['resume_professional_affiliations'] =
          this.resumeProfessionalAffiliations!.toJson();
    }
    if (resumeProfessionalCertifications != null) {
      data['resume_professional_certifications'] =
          this.resumeProfessionalCertifications!.toJson();
    }
    if (resumeProfessionalExperiences != null) {
      data['resume_professional_experiences'] =
          this.resumeProfessionalExperiences!.toJson();
    }
    if (resumePublications != null) {
      data['resume_publications'] = resumePublications!.toJson();
    }
    return data;
  }
}

class ResumeConcactInformation {
  int? id;
  int? userId;
  String? mobileNo;
  String? email;
  String? houseNo;
  String? area;
  String? city;
  String? state;
  String? pinCode;
  String? createdAt;
  String? updatedAt;

  ResumeConcactInformation(
      {this.id,
      this.userId,
      this.mobileNo,
      this.email,
      this.houseNo,
      this.area,
      this.city,
      this.state,
      this.pinCode,
      this.createdAt,
      this.updatedAt});

  ResumeConcactInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    houseNo = json['house_no'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    pinCode = json['pin_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['house_no'] = this.houseNo;
    data['area'] = this.area;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pin_code'] = this.pinCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ResumeAcademicHistories {
  int? id;
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
  String? createdAt;
  String? updatedAt;

  ResumeAcademicHistories(
      {this.id,
      this.userId,
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
      this.createdAt,
      this.updatedAt});

  ResumeAcademicHistories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['school_name'] = schoolName;
    data['yeas_of_passing'] = yeasOfPassing;
    data['ssl_socre'] = sslSocre;
    data['secondary_diploma'] = secondaryDiploma;
    data['year_of_passing'] = yearOfPassing;
    data['score'] = score;
    data['institute_name'] = instituteName;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['backlog'] = backlog;
    data['agregated_score'] = agregatedScore;
    data['gap_between_education'] = gapBetweenEducation;
    data['reason_gap_between_education'] = reasonGapBetweenEducation;
    data['master_insitute_name'] = masterInsituteName;
    data['sepcialization'] = sepcialization;
    data['years_of_completion'] = yearsOfCompletion;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ResumeAdditionalTrains {
  int? id;
  int? userId;
  String? companyName;
  String? secialization;
  String? description;
  String? createdAt;
  String? updatedAt;

  ResumeAdditionalTrains(
      {this.id,
      this.userId,
      this.companyName,
      this.secialization,
      this.description,
      this.createdAt,
      this.updatedAt});

  ResumeAdditionalTrains.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    companyName = json['company_name'];
    secialization = json['secialization'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['company_name'] = companyName;
    data['secialization'] = secialization;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ResumeConferenceAttendeds {
  int? id;
  int? userId;
  String? description;
  String? createdAt;
  String? updatedAt;

  ResumeConferenceAttendeds(
      {this.id, this.userId, this.description, this.createdAt, this.updatedAt});

  ResumeConferenceAttendeds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ResumeIndustryAwards {
  int? id;
  int? userId;
  String? awardDescription;
  String? createdAt;
  String? updatedAt;

  ResumeIndustryAwards(
      {this.id,
      this.userId,
      this.awardDescription,
      this.createdAt,
      this.updatedAt});

  ResumeIndustryAwards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    awardDescription = json['award_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['award_description'] = awardDescription;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ResumeKeySkills {
  int? id;
  int? userId;
  String? skill;
  String? createdAt;
  String? updatedAt;

  ResumeKeySkills(
      {this.id, this.userId, this.skill, this.createdAt, this.updatedAt});

  ResumeKeySkills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    skill = json['skill'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['skill'] = skill;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Resume {
  int? id;
  int? userId;
  String? url;
  String? createdAt;
  String? updatedAt;

  Resume({this.id, this.userId, this.url, this.createdAt, this.updatedAt});

  Resume.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['url'] = url;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ResumeProfessionalAffiliations {
  int? id;
  int? userId;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  ResumeProfessionalAffiliations(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.createdAt,
      this.updatedAt});

  ResumeProfessionalAffiliations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ResumeProfessionalExperiences {
  int? id;
  int? userId;
  String? companyName;
  String? role;
  String? fromDate;
  String? toDate;
  String? createdAt;
  String? updatedAt;

  ResumeProfessionalExperiences(
      {this.id,
      this.userId,
      this.companyName,
      this.role,
      this.fromDate,
      this.toDate,
      this.createdAt,
      this.updatedAt});

  ResumeProfessionalExperiences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    companyName = json['company_name'];
    role = json['role'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['company_name'] = companyName;
    data['role'] = role;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
