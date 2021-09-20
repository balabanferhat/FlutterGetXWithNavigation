import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/utils/globals.dart';

class SettingsController extends GetxController {
  var lockInBackground = true.obs;
  var notificationsEnabled = true.obs;
  var darkEnabled = false.obs;

  @override
  void onInit() {
    if (themeDark) {
      darkEnabled.value = true;
    } else {
      darkEnabled.value = false;
    }
  }
}
