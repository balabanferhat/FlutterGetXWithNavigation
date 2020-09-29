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
  ];
}