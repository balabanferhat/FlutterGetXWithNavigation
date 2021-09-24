import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:dio/src/form_data.dart' as formdata;
import 'package:dio/src/response.dart' as resp;
import 'package:get_x_with_nav/utils/globals.dart';
import 'package:get_x_with_nav/utils/log.dart';

import 'constants.dart';

class RestConnector {
  String url;
  String requestType;
  String data;
  formdata.FormData? formData;
  String dataType;
  bool clearCookies;
  RestConnector(
      {required this.url,
      this.requestType: "GET",
      this.data: "",
      this.formData: null,
      this.dataType: "json",
      this.clearCookies: false});

  Future<resp.Response> getData() async {
    //final MainController mainController = Get.put(MainController());
    //mainController.netControl();
    try {
      /* if (!mainController.checkInternet.values.first) {
        throw (InternetException());
      } else {*/
      Dio dio = Dio();
      RequestOptions requestOptions = RequestOptions(path: this.url);
      // donus json ve byte a gore değiştirildi.
      if (dataType == "json") {
        log("******** BEFORE JSON " +
            requestType +
            " REQUEST  ********* url:" +
            url +
            "; values:" +
            data.toString());

        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };
        String? myToken = GetStorage().read<String>("myToken");
        if (myToken == null) myToken = "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;

        //dio.interceptors.add(FambleInterceptors(requestOptions));

        //cache
        /*dio.interceptors.add(dioCacheManager.interceptor);
        Options cacheOptions = buildCacheOptions(Duration(minutes: 60),
            maxStale: Duration(days: 2),
            primaryKey: url,
            subKey: data,
            options: Options(method: requestType));

        var cookieJar = CookieJar();
        if (!clearCookies) {
          log("******** COOKIE ACTIVE *******");

          dio.interceptors.add(CookieManager(cookieJar));
        } else {
          log("******** COOKIE NOT ACTIVE *******");
          dio.interceptors.add(MyCookieManager(cookieJar));
        }
        */

        resp.Response response = await dio.request(
          url,
          data: data,
          //options: cacheOptions,
        );

        /*if (null != response.headers.value(DIO_CACHE_HEADER_KEY_DATA_SOURCE)) {
          log(url + " data come from cache");
        } else {
          log(url + " data come from net");
          log(url + " resp:" + response.data.toString());
        }*/
        log("******** AFTER JSON request, response:" +
            response.data.toString());
        return response;
      } else if (dataType == "VIDEO") {
        log("******** BEFORE VIDEO UPLOAD  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "multipart/form-data"
        };

        String? myToken = GetStorage().read<String>("myToken");
        if (myToken == null) myToken = "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;

        //var cookieJar = CookieJar();
        //dio.interceptors.add(CookieManager(cookieJar));

        //dio.interceptors.add(FambleInterceptors(requestOptions));
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType),
        );
        return response;
      } else {
        log("******** BEFORE OTHER REQUEST  ********* ");
        requestOptions.headers = {
          Headers.contentTypeHeader: "application/json"
        };

        String? myToken = GetStorage().read<String>("myToken");
        if (myToken == null) myToken = "";
        log("****** mToken in request:" + myToken);
        requestOptions.headers["X-Csrf-Token"] = myToken;

        //var cookieJar = CookieJar();
        //dio.interceptors.add(CookieManager(cookieJar));

        //dio.interceptors.add(FambleInterceptors(requestOptions));
        resp.Response response = await dio.request(
          url,
          data: formData,
          options: Options(method: requestType),
        );
        return response;
      }
    } on DioError catch (e) {
      log("EXCEPTION DIO ERROR FROM GETDATA:" + e.toString());
      //mySnackbarWithRetry("checkInternet".tr);
      throw (e);
    } catch (e) {
      /*if (!mainController.checkInternet.values.first) {
        log("EXCEPTION INTENET 2 FROM GETDATA:" + e.toString());
        throw (InternetException());
      } else {
        */
      var x = e.toString();
      //print(x);
      log("EXCEPTION OTHER FROM GETDATA:" + e.toString());
      throw Exception();
      // }
    }
  }
}
