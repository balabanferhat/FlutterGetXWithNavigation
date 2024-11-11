import 'package:dio/dio.dart';
import 'package:get_x_with_nav/generated/models/user_model.dart';
import 'package:get_x_with_nav/utils/constants.dart';
import 'package:get_x_with_nav/utils/log.dart';
import 'package:get_x_with_nav/utils/rest_connector.dart';

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
}
