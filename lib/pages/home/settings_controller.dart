import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/utils/globals.dart';
import 'package:get_x_with_nav/utils/log.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsController extends GetxController {
  var lockInBackground = true.obs;
  var notificationsEnabled = true.obs;
  var darkEnabled = false.obs;
  var versionName = "";
  @override
  Future<void> onInit() async {
    if (themeDark) {
      darkEnabled.value = true;
    } else {
      darkEnabled.value = false;
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    //String appName = packageInfo.appName;
    //String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    //String buildNumber = packageInfo.buildNumber;
    log("---- app version name:" + version);
    versionName = version;
  }
}
