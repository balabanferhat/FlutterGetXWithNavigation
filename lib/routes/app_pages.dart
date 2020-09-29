import 'package:get_x_with_nav/pages/test/test_view.dart';

import '../pages/settings/settings_view.dart';
import '../pages/home/home_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(), 
    ),
    GetPage(
      name: Routes.SETTINGS, 
      page:()=> SettingsView(), 
    ),
    GetPage(
      name: Routes.TEST, 
      page:()=> TestView(), 
    ),
  ];
}