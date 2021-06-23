import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/generated/models/user_model.dart';
import 'package:get_x_with_nav/routes/app_pages.dart';
import 'package:get_x_with_nav/services/login_api.dart';
import 'package:get_x_with_nav/utils/widgets.dart';

class LoginController extends GetxController {
  var myUser = User().obs;

  @override
  void onInit() => null;

  loginUser(String username, String password) async {
    print("login in controller....");

    Get.dialog(loading());
    Future.delayed(const Duration(seconds: 30), () => "5");

    User thisUser = await LoginAPI().login(username, password);
    myUser.value = thisUser;

    String myUser_str = jsonEncode(myUser.value.toJson());

    GetStorage().write("myUser", myUser_str);
    if (Get.isDialogOpen) Get.back();
    Get.offNamed(Routes.HOME);
    //Get.toNamed(Routes.LOGIN);
  }
}
