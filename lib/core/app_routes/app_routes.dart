import 'package:get/get.dart';
import '../../features/home/view/home_page.dart';
import '../../features/auth/view/sign_In_screen.dart';
import '../../features/auth/view/start_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String start = '/start';
  static const String signIn = '/sign-in';
  static const String home = '/home';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const StartScreen(),
    ),
    GetPage(
      name: start,
      page: () => const StartScreen(),
    ),
    GetPage(
      name: signIn,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: home,
      page: () => const HomePage(),
    ),
  ];
}

