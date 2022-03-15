import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/academic%20_history_response.dart';
import 'package:triya_app/services/api_service_methods.dart';

class ProfessionalExperienceController extends GetxController {
  final schoolName = TextEditingController();
  final yearOfPassing = TextEditingController();
  final sslScore = TextEditingController();
  final secondaryDiploma = TextEditingController();
  final yearOfPassingDiploma = TextEditingController();
  final score = TextEditingController();
  final instituteName = TextEditingController();
  final fromDate = TextEditingController();
  final toDate = TextEditingController();
  final backing = TextEditingController();
  final agregatedScore = TextEditingController();
  final gapEducation = TextEditingController();
  final reasonGap = TextEditingController();
  final clgName = TextEditingController();
  final specialization = TextEditingController();
  final yearOfCompleted = TextEditingController();

  void academicHistory() {
    Map<String, dynamic> history = {
      'school_name': schoolName.text,
      'yeas_of_passing': yearOfPassing.text,
      'ssl_socre': sslScore.text,
      'secondary_diploma': secondaryDiploma.text,
      'year_of_passing': yearOfPassingDiploma.text,
      'score': score.text,
      'institute_name': instituteName.text,
      'from_date': fromDate.text,
      'to_date': toDate.text,
      'backlog': backing.text,
      'agregated_score': agregatedScore.text,
      'gap_between_education': gapEducation.text,
      'reason_gap_between_education': reasonGap.text,
      'master_insitute_name': clgName.text,
      'sepcialization': specialization.text,
      'years_of_completion': yearOfCompleted.text,
    };
    BaseApiService.instance
        .post(ServiceConstant.academicHistory, data: history)
        .then((value) {
      AcademicHistoryResponse response =
          AcademicHistoryResponse.fromJson(value!.data);
      Get.snackbar(response.message!, "");
    });
  }
}
