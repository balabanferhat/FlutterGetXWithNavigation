import 'package:flutter/material.dart';

Widget homeWidget() {
  return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("HOME", style: TextStyle(fontSize: 30, fontFamily: 'Bold'))
          ],
        ),
      );
}