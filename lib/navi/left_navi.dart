import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/routes/app_pages.dart';

Widget leftNavi(String name) {
  return Drawer(
      child: ListView(
    children: [
      DrawerHeader(
        child: Text("Hoşgeldin " + name),
        decoration: BoxDecoration(color: Colors.blueAccent),
      ),
      ListTile(
        title: Text("Ana Sayfa"),
        onTap: () {},
      ),
      ListTile(
        title: Text("Hakkımızda"),
        onTap: () {},
      ),
      ListTile(
        title: Text("Çıkış"),
        onTap: () {
          print("logout clicked....");
          GetStorage().write("myUser", "");
          Get.toNamed(Routes.LOGIN);
        },
      )
    ],
  ));
}
