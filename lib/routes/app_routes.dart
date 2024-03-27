import 'package:firebase_learn/presentation/screens/authentication/register_screen.dart';
import 'package:get/get.dart';

import '../presentation/screens/authentication/login_screen.dart';

class Routes {
  static const login = '/login';
  static const register = '/register';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 0),
    ),
    GetPage(
      name: Routes.login,
      page: () => RegisterScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 0),
    ),
  ];
}
