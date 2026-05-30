import 'package:get/get.dart';
import '../../features/home/home_page.dart';
import '../../features/home/home_pages.dart';
import '../../features/auth/login_screen/login_screen.dart';
import '../../features/splash_screen/splash_screen.dart';
import '../../features/upload_data.dart';

class RouteHelper {
  static const String initial = '/';
  static const String loginPage = '/loginPage';
  static const String homePage = '/HomePage';
  static const String homePages = '/HomePages';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(
      name: loginPage,
      page: () => const LoginScreen(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: homePage,
      page: () => const HomePage(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: homePages,
      page: () => const HomePages(),
      transition: Transition.downToUp,
    ),
  ];
}
