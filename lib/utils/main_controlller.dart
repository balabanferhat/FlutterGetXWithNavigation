import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/generated/models/user_model.dart';
import 'package:get_x_with_nav/routes/app_pages.dart';
import 'package:get_x_with_nav/services/login_api.dart';

class MainController extends GetxController {
  var myUser_val = "".obs;

  @override
  void onInit() {
    print("On init HomeController");

    String myUser_str = GetStorage().read<String>('myUser');

    if (!myUser_str.isNull) myUser_val.value = myUser_str;

    super.onInit();
  }
  /*
  loginControl(loggedIn) {
    if (!loggedIn) {
      print("not logged in go to login page");
      //Get.offAllNamed(Routes.LOGIN);
      Get.toNamed(Routes.LOGIN);
    }
  }*/
}
