import 'package:get/get.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/ui/auth/candidate_login/candidate_choose_login_type.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_dashboard.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/add_new_job.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/applied_candidates.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_home/view_appliead.dart';
import 'package:triya_app/ui/auth/employer_login/employer_login_screen.dart';
import 'package:triya_app/ui/auth/employer_login/employer_sign_in.dart';
import 'package:triya_app/ui/auth/employer_login/employer_sign_up.dart';
import 'package:triya_app/ui/auth/login/login_screen.dart';
import 'package:triya_app/ui/auth/login_type_screen.dart';
import 'package:triya_app/ui/auth/otp_login/otp_login.dart';
import 'package:triya_app/ui/auth/otp_login/otp_submit.dart';
import 'package:triya_app/ui/auth/signup/signup.dart';
import 'package:triya_app/ui/auth/splash_screen.dart';
import 'package:triya_app/ui/candidate_deshboard/candidate_dashboard.dart';
import 'package:triya_app/ui/candidate_deshboard/home/book/book_category.dart';
import 'package:triya_app/ui/candidate_deshboard/home/book/books.dart';
import 'package:triya_app/ui/candidate_deshboard/home/gov/gov.dart';
import 'package:triya_app/ui/candidate_deshboard/home/gov/gov_description.dart';
import 'package:triya_app/ui/candidate_deshboard/home/home.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/private.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/private_description.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/private_job_resume_screen.dart';
import 'package:triya_app/ui/candidate_deshboard/home/private/private_resume_apply.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/ConferenceAttended.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/academic_history_screen.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/additional_training.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/contact_information_screen.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/industry_awards.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/key_skills_screen.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/normal_resume.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/personal_statement_screen.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/professiocal_affiliation.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/professional_certifications.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/proffessional_screen.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/publication.dart';
import 'package:triya_app/ui/candidate_deshboard/home/resume/resume.dart';
import 'package:triya_app/ui/candidate_deshboard/home/scholarship/scholarship.dart';
import 'package:triya_app/ui/candidate_deshboard/home/scholarship/scholarship_description.dart';
import 'package:triya_app/ui/candidate_deshboard/home/video/video_category.dart';
import 'package:triya_app/ui/candidate_deshboard/home/video/videos.dart';

class NavigationRoute {
  static final List<GetPage> pages = [
    GetPage(
      name: NavigationName.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: NavigationName.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: NavigationName.signup,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: NavigationName.otpLogin,
      page: () => OTPLoginScreen(),
    ),
    GetPage(
      name: NavigationName.otpSubmit,
      page: () => const OTPSubmitScreen(),
    ),
    GetPage(
      name: NavigationName.dashboard,
      page: () => Dashboard(),
    ),
    GetPage(
      name: NavigationName.homePage,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: NavigationName.bookPage,
      page: () => const BooksScreen(),
    ),
    GetPage(
      name: NavigationName.bookCategoryPage,
      page: () => const BookCategoryScreen(),
    ),
    GetPage(
      name: NavigationName.videoPage,
      page: () => const VideoScreen(),
    ),
    GetPage(
      name: NavigationName.videoCategoryPage,
      page: () => const VideoCategoryScreen(),
    ),
    GetPage(
      name: NavigationName.govJobPage,
      page: () => const GovJobScreen(),
    ),
    GetPage(
      name: NavigationName.govJobDescPage,
      page: () => const GovDescription(),
    ),
    GetPage(
      name: NavigationName.privateJobPage,
      page: () => const PrivateJobScreen(),
    ),
    GetPage(
      name: NavigationName.privateJobDescPage,
      page: () => const PrivateDescription(),
    ),
    GetPage(
      name: NavigationName.privateJobResumePage,
      page: () => const PrivateJobResumeScreen(),
    ),
    GetPage(
      name: NavigationName.privateResumeApplyPage,
      page: () => const PrivateResumeApply(),
    ),
    GetPage(
      name: NavigationName.scholarshipJobPage,
      page: () => const ScholarshipJobScreen(),
    ),
    GetPage(
      name: NavigationName.scholarshipJobDescPage,
      page: () => const ScholarshipDescription(),
    ),
    GetPage(
      name: NavigationName.resumePage,
      page: () => const ResumeScreen(),
    ),
    GetPage(
      name: NavigationName.loginTypePage,
      page: () => const LoginTypeScreen(),
    ),
    GetPage(
      name: NavigationName.candidateLoginType,
      page: () => CandidateChooseLoginType(),
    ),
    GetPage(
      name: NavigationName.professionalResumePage,
      page: () => const ProfessionalResumeScreen(),
    ),
    GetPage(
      name: NavigationName.personalPage,
      page: () => const PersonalStatementScreen(),
    ),
    GetPage(
      name: NavigationName.contactPage,
      page: () => const ContactInformationScreen(),
    ),
    GetPage(
      name: NavigationName.professionalPage,
      page: () => const ProfessionalScreen(),
    ),
    GetPage(
      name: NavigationName.academicPage,
      page: () => const AcademicScreen(),
    ),
    GetPage(
      name: NavigationName.keySkillsPage,
      page: () => const KeySkillsScreen(),
    ),
    GetPage(
      name: NavigationName.employerLoginType,
      page: () => const EmployerLogin(),
    ),
    GetPage(
      name: NavigationName.employerLogin,
      page: () => EmployerSignInScreen(),
    ),
    GetPage(
      name: NavigationName.employerSignUp,
      page: () => EmployerSignUp(),
    ),
    GetPage(
      name: NavigationName.employerDashboard,
      page: () => EmployerDashboard(),
    ),
    GetPage(
      name: NavigationName.addNewJob,
      page: () => AddNewJobScreen(),
    ),
    GetPage(
      name: NavigationName.viewAppliead,
      page: () => ViewApplieadScreen(),
    ),
    GetPage(
      name: NavigationName.appliedCandidates,
      page: () => AppliedCandidateScreen(),
    ),
    GetPage(
      name: NavigationName.industryAwards,
      page: () => IndustryAwardScreen(),
    ),
    GetPage(
      name: NavigationName.professionalCertifications,
      page: () => ProfessionalCertificationScreen(),
    ),
    GetPage(
      name: NavigationName.publication,
      page: () => PublicationScreen(),
    ),
    GetPage(
      name: NavigationName.professiocal_Affiliation,
      page: () => ProfessiocalAffiliationScreen(),
    ),
    GetPage(
      name: NavigationName.conference_Attended,
      page: () => ConferenceAttendedScreen(),
    ),
    GetPage(
      name: NavigationName.additional_Training,
      page: () => AdditionalTrainingScreen(),
    ),
  ];
}
