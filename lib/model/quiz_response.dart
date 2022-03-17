class QuizResponse {
  bool? errors;
  List<QuizModel>? data;
  String? message;

  QuizResponse({this.errors, this.data, this.message});

  QuizResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];
    if (json['data'] != null) {
      data = <QuizModel>[];
      json['data'].forEach((v) {
        data!.add(new QuizModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class QuizModel {
  int? id;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? createdAt;
  String? updatedAt;
  List<Poll>? poll;
  List<Poll>? pollOption1;
  List<Poll>? pollOption2;
  List<Poll>? pollOption3;
  List<Poll>? pollOption4;

  QuizModel(
      {this.id,
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.createdAt,
      this.updatedAt});

  QuizModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['poll'] != null) {
      poll = <Poll>[];
      json['poll'].forEach((v) {
        poll!.add(new Poll.fromJson(v));
      });
    }
    if (json['poll'] != null) {
      pollOption1 = poll!.where((element) => element.option == 1).toList();
      pollOption2 = poll!.where((element) => element.option == 2).toList();
      pollOption3 = poll!.where((element) => element.option == 3).toList();
      pollOption4 = poll!.where((element) => element.option == 4).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['option1'] = this.option1;
    data['option2'] = this.option2;
    data['option3'] = this.option3;
    data['option4'] = this.option4;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.poll != null) {
      data['poll'] = this.poll!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Poll {
  int? id;
  int? userId;
  int? queId;
  int? option;

  Poll({this.id, this.userId, this.queId, this.option});

  Poll.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    queId = json['que_id'];
    option = json['option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['que_id'] = this.queId;
    data['option'] = this.option;
    return data;
  }
}
