import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:triya_app/constants/service_constant.dart';
import 'package:triya_app/model/academic%20_history_response.dart';
import 'package:triya_app/services/api_service_methods.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/professional_resume_controller.dart';

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
  @override
  void onReady() {
    super.onReady();
    final resumeViewController = Get.put(ProfileResumeController());
    if ((resumeViewController.resumeResponse.value?.resumeData?.length ?? 0) !=
        0) {
      schoolName.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeAcademicHistories?.schoolName ??
          "";

      yearOfPassing.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeAcademicHistories?.yearOfPassing ??
          "";
      sslScore.text = resumeViewController.resumeResponse.value?.resumeData?[0]
              .resumeAcademicHistories?.sslSocre ??
          "";
      secondaryDiploma.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeAcademicHistories?.secondaryDiploma ??
          "";
      yearOfPassingDiploma.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeAcademicHistories?.yearOfPassing ??
          "";
      score.text = resumeViewController.resumeResponse.value?.resumeData?[0]
              .resumeAcademicHistories?.score ??
          "";
      instituteName.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeAcademicHistories?.instituteName ??
          "";
      fromDate.text = resumeViewController.resumeResponse.value?.resumeData?[0]
              .resumeAcademicHistories?.fromDate ??
          "";
      toDate.text = resumeViewController.resumeResponse.value?.resumeData?[0]
              .resumeAcademicHistories?.toDate ??
          "";
      backing.text = resumeViewController.resumeResponse.value?.resumeData?[0]
              .resumeAcademicHistories?.backlog ??
          "";
      agregatedScore.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeAcademicHistories?.agregatedScore ??
          "";
      gapEducation.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeAcademicHistories?.gapBetweenEducation ??
          "";
      reasonGap.text = resumeViewController.resumeResponse.value?.resumeData?[0]
              .resumeAcademicHistories?.reasonGapBetweenEducation ??
          "";
      clgName.text = resumeViewController.resumeResponse.value?.resumeData?[0]
              .resumeAcademicHistories?.masterInsituteName ??
          "";
      specialization.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeAcademicHistories?.sepcialization ??
          "";
      yearOfCompleted.text = resumeViewController.resumeResponse.value
              ?.resumeData?[0].resumeAcademicHistories?.yearsOfCompletion ??
          "";
    }
  }

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
