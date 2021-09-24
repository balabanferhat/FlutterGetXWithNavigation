import 'package:get_x_with_nav/pages/splash/splash_view.dart';

import '../pages/login/login_view.dart';
import '../pages/home/home_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;
  static const LOGIN = Routes.LOGIN;
  static const SPLASH = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
    ),
  ];
}
