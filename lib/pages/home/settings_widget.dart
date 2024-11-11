import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_with_nav/pages/home/languages_screen.dart';
import 'package:get_x_with_nav/pages/home/settings_controller.dart';
import 'package:get_x_with_nav/utils/themes.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

Widget settingsWidget() {
  final SettingsController settingsController = Get.put(SettingsController());

  return Obx(() => SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: [
              SettingsTile(
                title: Text('Language'),
                description: Text('English'),
                leading: Icon(Icons.language),
                onPressed: (context) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => LanguagesScreen(),
                  ));
                },
              ),
              /*CustomTile(
              child: Container(
                color: Color(0xFFEFEFF4),
                padding: EdgeInsetsDirectional.only(
                  start: 14,
                  top: 12,
                  bottom: 30,
                  end: 14,
                ),
                child: Text(
                  'You can setup the language you want',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w400,
                    fontSize: 13.5,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),*/
              SettingsTile(
                title: Text('Environment'),
                description: Text('Production'),
                leading: Icon(Icons.cloud_queue),
              ),
            ],
          ),
          SettingsSection(
            title: Text('Account'),
            tiles: [
              SettingsTile(title: Text('Phone number'), leading: Icon(Icons.phone)),
              SettingsTile(title: Text('Email'), leading: Icon(Icons.email)),
              SettingsTile(title: Text('Sign out'), leading: Icon(Icons.exit_to_app)),
            ],
          ),
          SettingsSection(
            title: Text('Security'),
            tiles: [
              SettingsTile.switchTile(
                title: Text('Lock app in background'),
                leading: Icon(Icons.phonelink_lock),
                initialValue: settingsController.lockInBackground.value,
                onToggle: (bool value) {
                  settingsController.lockInBackground.value = value;
                  settingsController.notificationsEnabled.value = value;
                },
              ),
              SettingsTile.switchTile(
                title: Text('Use fingerprint'),
                description: Text('Allow application to access stored fingerprint IDs.'),
                leading: Icon(Icons.fingerprint),
                onToggle: (bool value) {},
                initialValue: false,
              ),
              SettingsTile.switchTile(
                title: Text('Change password'),
                leading: Icon(Icons.lock),
                initialValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: Text('Enable Notifications'),
                initialValue: settingsController.notificationsEnabled.value,
                leading: Icon(Icons.notifications_active),
                enabled: true,
                onToggle: (value) {
                  settingsController.notificationsEnabled.value = value;
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text('Misc'),
            tiles: [
              SettingsTile(
                  title: Text('Terms of Service'), leading: Icon(Icons.description)),
              SettingsTile.switchTile(
                title: Text('Enable Dark Mode'),
                initialValue: settingsController.darkEnabled.value,
                leading: Icon(Icons.dark_mode_outlined),
                enabled: true,
                onToggle: (value) {
                  GetStorage().write("themeDark", value);
                  if (value) {
                    Get.changeTheme(Themes.dark);
                  } else {
                    Get.changeTheme(Themes.light);
                  }
                  settingsController.darkEnabled.value = value;
                },
              ),
            ],
          ),
          SettingsSection(
            // Bu kısım özel bir widget veya bölüm olabilir.
            title: Text('Version Info'), // Özel bölüm başlığı
            tiles: [
              SettingsTile(
                title:   Text(
                  'Version: ' + settingsController.versionName,
                  style: TextStyle(color: Color(0xFF777777)),
                ),
                description: Text('Version details here'),
                leading: Icon(Icons.info_outline),
              ),
            ],
          ),
          
        ],
      ));
}
