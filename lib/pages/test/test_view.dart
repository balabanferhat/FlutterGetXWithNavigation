import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'test_controller.dart';

class TestView extends  StatelessWidget  {

  final TestController testController = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test')
      ), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text("TEST",style:TextStyle(fontSize: 30,fontFamily: 'Bold'))
          ],
        ),
      ),
    );
  }
}
  