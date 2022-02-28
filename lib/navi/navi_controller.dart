import 'package:get/get.dart';
import 'package:get_x_with_nav/routes/app_pages.dart';

class NaviController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    print("On init NaviController");

    super.onInit();
  }

  void onBottomNavItemTapped(int index) {
    print("tab item clicked:" + index.toString());
    selectedIndex.value = index;
    /*
    switch (index) {
      case 0:
        Get.toNamed(Routes.HOME);
        break;

       case 1:
        Get.toNamed(Routes.TEST);
        break;

       case 2:
        Get.toNamed(Routes.SETTINGS);
        break;    
      default:
    }
    */
  }
}
