import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/lang/lang.dart';
import 'package:get_x_with_nav/pages/login/login_controller.dart';
import 'package:get_x_with_nav/utils/globals.dart';
import 'package:get_x_with_nav/utils/log.dart';
import 'package:get_x_with_nav/utils/themes.dart';

import 'generated/models/user_model.dart';
import 'routes/app_pages.dart';

void main() async {
  await GetStorage.init();

  LoginController loginController = Get.put(LoginController());

  String initialRoute = AppPages.INITIAL;
  if (loginController.myUser_val.value == "") {
    initialRoute = AppPages.LOGIN;
  } else {
    User loggedInUser =
        User.fromJson(jsonDecode(loginController.myUser_val.value));
    loginController.myUser.value = loggedInUser;
  }

  final Locale? deviceLocale = Get.deviceLocale;
  log("---- device languageCode:" + deviceLocale!.languageCode);
  log("---- device countryCode:" + deviceLocale.countryCode!);

  themeDark = GetStorage().read<bool>('themeDark') ?? false;
  log("---- device themeDark:" + themeDark.toString());

  if (themeDark) {
    Get.changeTheme(Themes.dark);
  } else {
    Get.changeTheme(Themes.light);
  }
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: initialRoute,
      translations: Lang(),
      locale: deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      getPages: AppPages.routes,
      theme: Themes.light,
      darkTheme: Themes.dark,
    ),
  );
}
