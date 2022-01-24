import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_x_with_nav/generated/models/user_model.dart';
import 'package:get_x_with_nav/pages/login/login_controller.dart';
import 'package:get_x_with_nav/routes/app_pages.dart';
import 'package:get_x_with_nav/utils/log.dart';
import 'package:get_x_with_nav/utils/mysnackbar.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    log("On init SplashController");

    LoginController loginController =
        Get.put(LoginController(), permanent: true);

    String initialRoute = AppPages.INITIAL;
    if (loginController.myUser_val.value == "") {
      initialRoute = AppPages.LOGIN;
    } else {
      User loggedInUser =
          User.fromJson(jsonDecode(loginController.myUser_val.value));
      loginController.myUser.value = loggedInUser;
    }
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(initialRoute);

      //test snackbar
      /*
      mySnackbarWithRetry(
          "Veri erişiminde bir problem oluştu. Lütfen internet bağlantınızı kontrol edip tekrar deneyiniz!");
          */
    });

    //Get.off(HomeView());
    super.onInit();
  }

  @override
  void onClose() {
    log("onClose SplashController");
    // TODO: implement onClose
    super.onClose();
  }
}
