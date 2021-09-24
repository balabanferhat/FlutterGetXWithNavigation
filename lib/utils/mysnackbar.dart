import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_x_with_nav/pages/splash/splash_view.dart';

import '../pages/home/home_view.dart';

void mySnackbarWithExit(String msg) {
  Get.snackbar(
    '',
    '',
    titleText: Text(
      "error".tr,
      //style: alertTitleStyle(fontsize: 0),
    ),
    messageText: Semantics(
        container: true,
        liveRegion: true,
        child: Text(
          msg,
          //style: TextStyle(color: oppositeBackgroundColor()),
        )),
    //messageText: Text(msg, style: alertSubTitleStyle(fontsize: 0)),
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 4),
    borderRadius: 16,
    //backgroundColor: snackBarBackgroundColor(),
    mainButton: TextButton(
      onPressed: () {
        exit(0);
      },
      child: Text(
        "close".tr,
        //style: snackBarButtonTextStyle(fontsize: 0),
      ),
    ),
  );
}

void mySnackbarWithRetry(String msg) {
  Get.rawSnackbar(
    titleText: Text(
      "HATA".tr,
      //style: alertTitleStyle(fontsize: 0),
    ),
    messageText: Semantics(
        label: "",
        container: true,
        liveRegion: true,
        child: Text(
          msg,
          //style: TextStyle(color: oppositeBackgroundColor()),
        )),

    //messageText: Text(msg, style: alertSubTitleStyle(fontsize: 0)),
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 60000),
    borderRadius: 16,
    //backgroundColor: snackBarBackgroundColor(),
    mainButton: Column(children: <Widget>[
      TextButton(
        onPressed: () {
          //exit(0);
          //Get.offAll(() => FirstSplashView());
        },
        child: Text(
          "TEKRAR DENE".tr,
          //style: snackBarButtonTextStyle(fontsize: 0),
        ),
      ),
      TextButton(
        onPressed: () {
          exit(0);
        },
        child: Text(
          "ÇIKIŞ".tr,
          //style: snackBarButtonTextStyle(fontsize: 0),
        ),
      ),
    ]),
  );
}

void mySnackbarWithRetryOffline(String msg) {
  Get.rawSnackbar(
    titleText: Text(
      "HATA".tr,
      //style: alertTitleStyle(fontsize: 0),
    ),
    messageText: Semantics(
        container: true,
        liveRegion: true,
        child: Text(
          msg,
          //style: TextStyle(color: oppositeBackgroundColor()),
        )),
    //messageText: Text(msg, style: alertSubTitleStyle(fontsize: 0)),
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 60000),
    borderRadius: 16,
    //backgroundColor: snackBarBackgroundColor(),
    mainButton: Column(children: <Widget>[
      TextButton(
        onPressed: () {
          //exit(0);
          //Get.offAll(() => FirstSplashView());
        },
        child: Text(
          "TEKRAR DENE".tr,
          //style: snackBarButtonTextStyle(fontsize: 0),
        ),
      ),
      TextButton(
        onPressed: () {
          //Get.offAll(OfflineView());
        },
        child: Text(
          "ÇEVRİMDIŞI OKU".tr,
          // style: snackBarButtonTextStyle(fontsize: 0),
        ),
      ),
      TextButton(
        onPressed: () {
          exit(0);
        },
        child: Text(
          "ÇIKIŞ".tr,
          //style: snackBarButtonTextStyle(fontsize: 0),
        ),
      ),
    ]),
  );
}

void mySnackbarInfo(String msg) {
  Get.snackbar(
    '',
    '',
    titleText: Text(
      "",
      //style: alertTitleStyle(fontsize: 0),
    ),
    messageText: Semantics(
      container: true,
      liveRegion: true,
      //child: Text(msg, style: alertSubTitleStyle(fontsize: 0)),
    ),
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 2),
    borderRadius: 16,
    //backgroundColor: snackBarBackgroundColor(),
  );

  //Scaffold.of(Get.context).showSnackBar(MySnack(content: Text(msg)));
}

void mySnackbarError(String msg) {
  Get.snackbar(
    '',
    '',
    titleText: Text(
      "HATA".tr,
      //style: alertTitleStyle(fontsize: 0),
    ),
    messageText: Semantics(
      container: true,
      liveRegion: true,
      //child: Text(msg.tr, style: alertSubTitleStyle(fontsize: 0)),
    ),
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 4),
    borderRadius: 16,
    //backgroundColor: snackBarBackgroundColor(),
    mainButton: TextButton(
      onPressed: () {
        //exit(0);
        Get.back();
      },
      child: Text(
        "TAMAM".tr,
        //style: snackBarButtonTextStyle(fontsize: 0),
      ),
    ),
  );
}
