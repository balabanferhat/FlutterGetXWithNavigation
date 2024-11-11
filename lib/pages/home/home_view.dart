import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_with_nav/navi/bottom_navi.dart';
import 'package:get_x_with_nav/navi/left_navi.dart';
import 'package:get_x_with_nav/navi/navi_controller.dart';
import 'package:get_x_with_nav/pages/home/home_widget.dart';
import 'package:get_x_with_nav/pages/home/settings_widget.dart';
import 'package:get_x_with_nav/pages/home/test_widget.dart';
import 'package:get_x_with_nav/pages/login/login_controller.dart';

import 'home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final NaviController naviController = Get.put(NaviController());
  final LoginController loginController =
      Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetList = <Widget>[
      homeWidget(),
      testWidget(),
      settingsWidget()
    ];
    return Scaffold(
      //backgroundColor: Get.theme.backgroundColor,
      appBar: AppBar(
        title: Text('home'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              naviController.selectedIndex.value = 2;
            },
          )
        ],
      ),
      drawer: leftNavi(loginController.myUser.value.name.toString()),
      bottomNavigationBar: bottomNavi(naviController),
      body:
          Obx(() => _widgetList.elementAt(naviController.selectedIndex.value)),
    );
  }
}
