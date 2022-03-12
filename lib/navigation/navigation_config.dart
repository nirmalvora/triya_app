import 'package:get/get.dart';
import 'package:triya_app/ui/auth/deshboard/home/book_category.dart';
import 'package:triya_app/ui/auth/deshboard/home/books.dart';
import 'package:triya_app/ui/auth/deshboard/home/gov/gov.dart';
import 'package:triya_app/ui/auth/deshboard/home/gov/gov_description.dart';
import 'package:triya_app/ui/auth/deshboard/home/home.dart';
import 'package:triya_app/ui/auth/deshboard/home/video_category.dart';
import 'package:triya_app/ui/auth/deshboard/home/videos.dart';
import 'package:triya_app/ui/auth/login/login_screen.dart';
import 'package:triya_app/ui/auth/splash_screen.dart';
import 'package:triya_app/navigation/navigation_constant.dart';

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
  ];
}
