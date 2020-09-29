import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_x_with_nav/navi/navi_controller.dart';

Widget bottomNavi(NaviController naviController)  {

return Obx(()=>  BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: "Test"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: naviController.selectedIndex.value,
        onTap: naviController.onBottomNavItemTapped,
      ));

}