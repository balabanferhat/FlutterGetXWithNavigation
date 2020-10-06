import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/pages/login/login_controller.dart';
import 'package:get_x_with_nav/utils/main_controlller.dart';

import 'generated/models/user_model.dart';
import 'routes/app_pages.dart';

void main() async {
  await GetStorage.init();

  MainController mainController = Get.put(MainController());
  LoginController loginController = Get.put(LoginController());

  String initialRoute = AppPages.INITIAL;
  if (mainController.myUser_val.value == "") {
    initialRoute = AppPages.LOGIN;
  } else {
    User loggedInUser =
        User.fromJson(jsonDecode(mainController.myUser_val.value));
    loginController.myUser.value = loggedInUser;
  }

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: initialRoute,
      getPages: AppPages.routes,
    ),
  );
}
