import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/generated/models/user_model.dart';
import 'package:get_x_with_nav/pages/home/home_view.dart';
import 'package:get_x_with_nav/routes/app_pages.dart';
import 'package:get_x_with_nav/services/login_api.dart';
import 'package:get_x_with_nav/utils/log.dart';
import 'package:get_x_with_nav/utils/widgets.dart';

class LoginController extends GetxController {
  var myUser = User(name: "", surname: "", token: "").obs;
  var myUser_val = "".obs;

  @override
  void onInit() {
    log("********* On init LoginController");

    String? myUser_str = GetStorage().read<String>('myUser');

    if (myUser_str != null) myUser_val.value = myUser_str;

    super.onInit();
  }

  void onClose() {
    log("********* onClose LoginController");
  }

  loginFunc(username, password) async {
    log("----- 3s waiting....");
    User? thisUser = await LoginAPI().login(username, password);
    if (thisUser == null) {
      Get.snackbar("warning".tr, "check_username_and_pass".tr);
    } else {
      myUser.value = thisUser;

      String myUser_str = jsonEncode(myUser.value.toJson());

      GetStorage().write("myUser", myUser_str);
      if (Get.isDialogOpen!) Get.back();
      Get.offAll(() => HomeView());
      //Get.toNamed(Routes.LOGIN);
    }
  }

  loginUser(String username, String password) async {
    print("login in controller....");

    Get.dialog(loading());
    Future.delayed(const Duration(seconds: 3),
        () async => {loginFunc(username, password)});
  }
}
