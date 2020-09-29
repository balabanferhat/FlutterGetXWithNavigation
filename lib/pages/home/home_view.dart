import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/navi/bottom_navi.dart';
import 'package:get_x_with_nav/navi/left_navi.dart';
import 'package:get_x_with_nav/navi/navi_controller.dart';
import 'package:get_x_with_nav/pages/home/home_widget.dart';
import 'package:get_x_with_nav/pages/settings/settings_widget.dart';
import 'package:get_x_with_nav/pages/test/test_widget.dart';
import 'package:get_x_with_nav/routes/app_pages.dart';

import 'home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final NaviController naviController = Get.put(NaviController());

  @override
  Widget build(BuildContext context) {

    List<Widget> _widgetList = <Widget>[
        homeWidget(),
        testWidget(),
        settingsWidget()
    ];
    return Scaffold(
      appBar: AppBar(title: Text('home')),
      drawer:  leftNavi(),
      bottomNavigationBar: bottomNavi(naviController),
      body: Obx(()=> _widgetList.elementAt(naviController.selectedIndex.value)),
    );
  }
}
