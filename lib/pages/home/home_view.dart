import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/routes/app_pages.dart';

import 'home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home')),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            child: Text("Hoşgeldin"),
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
              //homeController.isLoggedIn.value=false;
              GetStorage().write("isLoggedIn",false);
              Get.toNamed(Routes.LOGIN);
            },
          )
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: "Test"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: 0,
        //onTap: ,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("HOME", style: TextStyle(fontSize: 30, fontFamily: 'Bold'))
          ],
        ),
      ),
    );
  }
}
