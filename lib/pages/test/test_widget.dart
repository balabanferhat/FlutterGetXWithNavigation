import 'package:flutter/material.dart';

Widget testWidget() {
  return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("TEST", style: TextStyle(fontSize: 30, fontFamily: 'Bold'))
          ],
        ),
      );
}