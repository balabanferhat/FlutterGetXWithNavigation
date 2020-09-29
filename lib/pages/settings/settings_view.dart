import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_with_nav/navi/bottom_navi.dart';
import 'package:get_x_with_nav/navi/left_navi.dart';
import 'package:get_x_with_nav/navi/navi_controller.dart';

import 'settings_controller.dart';

class SettingsView extends  StatelessWidget  {

  final SettingsController settingsController = Get.put(SettingsController());
  final NaviController naviController = Get.put(NaviController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home')),
      drawer:  leftNavi(),
      bottomNavigationBar: bottomNavi(naviController),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("SETTINGS", style: TextStyle(fontSize: 30, fontFamily: 'Bold'))
          ],
        ),
      ),
    );
  }
}
  