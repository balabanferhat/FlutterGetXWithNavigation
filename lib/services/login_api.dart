import 'package:dio/dio.dart';
import 'package:get_x_with_nav/generated/models/personel.dart';
import 'package:get_x_with_nav/generated/models/user_model.dart';
import 'package:get_x_with_nav/utils/constants.dart';
import 'package:get_x_with_nav/utils/log.dart';
import 'package:get_x_with_nav/utils/rest_connector.dart';
import 'dart:convert' as convert;

class LoginAPI {
  Future<User?> login(String username, String password) async {
    final url =
        base_url + "test.json?username=" + username + "&pass=" + password;
    log(url);
    try {
      //Response response = await Dio().get(url);
      Response response = await RestConnector(url: url).getData();

      /*Response response = await RestConnector(
          url: url,
          requestType: "POST",
          clearCookies: true,
          data: convert.jsonEncode({
            "name": username,
            "pass": password,
          })).getData();*/

      //log(response);

      final user = User.fromJson(response.data);
      return user;
    } catch (e) {
      log(e);
      return null;
    }
  }

  Future<List<Personel>> personelListesi() async {
    final url =
        "http://10.101.1.17:1616/buski/services/wsPersonel/personelBilgileri?kullaniciAdi=Buyuksehir&sifre=Buski2021";
    log(url);
    Iterable<Personel> personelList = [];
    try {
      //Response response = await Dio().get(url);
      Response response = await RestConnector(url: url).getData();

      /*Response response = await RestConnector(
          url: url,
          requestType: "POST",
          clearCookies: true,
          data: convert.jsonEncode({
            "name": username,
            "pass": password,
          })).getData();*/

      //log(response);
      if (response.statusCode == 200) {
        var sonucKodu = response.data["sonucKodu"];
        if (sonucKodu != "0000") return [];

        List collection = response.data["personelListesi"];
        personelList = collection.map((json) => Personel.fromJson(json));

        return personelList.toList();
      } else {
        return [];
      }
    } catch (e) {
      log(e);
      throw Exception(
          'Müracaat Bilgileri yüklenirken hata oluştu:' + e.toString());
    }
  }
}
