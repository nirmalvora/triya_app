import 'package:get/get.dart';
import 'package:triya_app/navigation/navigation_constant.dart';
import 'package:triya_app/ui/auth/candidate_login/candidate_choose_login_type.dart';
import 'package:triya_app/ui/auth/employer_dashboard/employer_dashboard.dart';
import 'package:triya_app/ui/auth/employer_login/employer_login_screen.dart';
import 'package:triya_app/ui/auth/employer_login/employer_sign_in.dart';
import 'package:triya_app/ui/auth/employer_login/employer_sign_up.dart';
import 'package:triya_app/ui/auth/login/login_screen.dart';
import 'package:triya_app/ui/auth/login_type_screen.dart';
import 'package:triya_app/ui/auth/otp_login/otp_login.dart';
import 'package:triya_app/ui/auth/otp_login/otp_submit.dart';
import 'package:triya_app/ui/auth/signup/signup.dart';
import 'package:triya_app/ui/auth/splash_screen.dart';
import 'package:triya_app/ui/deshboard/dashboard.dart';
import 'package:triya_app/ui/deshboard/home/book/book_category.dart';
import 'package:triya_app/ui/deshboard/home/book/books.dart';
import 'package:triya_app/ui/deshboard/home/gov/gov.dart';
import 'package:triya_app/ui/deshboard/home/gov/gov_description.dart';
import 'package:triya_app/ui/deshboard/home/home.dart';
import 'package:triya_app/ui/deshboard/home/private/private.dart';
import 'package:triya_app/ui/deshboard/home/private/private_description.dart';
import 'package:triya_app/ui/deshboard/home/private/private_job_resume_screen.dart';
import 'package:triya_app/ui/deshboard/home/private/private_resume_apply.dart';
import 'package:triya_app/ui/deshboard/home/resume/resume.dart';
import 'package:triya_app/ui/deshboard/home/scholarship/scholarship.dart';
import 'package:triya_app/ui/deshboard/home/scholarship/scholarship_description.dart';
import 'package:triya_app/ui/deshboard/home/video/video_category.dart';
import 'package:triya_app/ui/deshboard/home/video/videos.dart';

import '../ui/deshboard/home/resume/academic_history_screen.dart';
import '../ui/deshboard/home/resume/contact_information_screen.dart';
import '../ui/deshboard/home/resume/proffessional_screen.dart';
import '../ui/deshboard/home/resume/key_skills_screen.dart';
import '../ui/deshboard/home/resume/normal_resume.dart';
import '../ui/deshboard/home/resume/personal_statement_screen.dart';

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
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: NavigationName.otpLogin,
      page: () => const OTPLoginScreen(),
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
      name: NavigationName.bookCategoryPage,
      page: () => const VideoCategoryScreen(),
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
      page: () => const CandidateChooseLoginType(),
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
      page: () => const EmployerSignInScreen(),
    ),
    GetPage(
      name: NavigationName.employerSignUp,
      page: () => const EmployerSignUp(),
    ),
    GetPage(
      name: NavigationName.employerDashboard,
      page: () => EmployerDashboard(),
    ),
  ];
}
