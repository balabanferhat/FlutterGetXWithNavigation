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
            title: 'Common',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
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
                title: 'Environment',
                subtitle: 'Production',
                leading: Icon(Icons.cloud_queue),
              ),
            ],
          ),
          SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(title: 'Phone number', leading: Icon(Icons.phone)),
              SettingsTile(title: 'Email', leading: Icon(Icons.email)),
              SettingsTile(title: 'Sign out', leading: Icon(Icons.exit_to_app)),
            ],
          ),
          SettingsSection(
            title: 'Security',
            tiles: [
              SettingsTile.switchTile(
                title: 'Lock app in background',
                leading: Icon(Icons.phonelink_lock),
                switchValue: settingsController.lockInBackground.value,
                onToggle: (bool value) {
                  settingsController.lockInBackground.value = value;
                  settingsController.notificationsEnabled.value = value;
                },
              ),
              SettingsTile.switchTile(
                title: 'Use fingerprint',
                subtitle: 'Allow application to access stored fingerprint IDs.',
                leading: Icon(Icons.fingerprint),
                onToggle: (bool value) {},
                switchValue: false,
              ),
              SettingsTile.switchTile(
                title: 'Change password',
                leading: Icon(Icons.lock),
                switchValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: 'Enable Notifications',
                switchValue: settingsController.notificationsEnabled.value,
                leading: Icon(Icons.notifications_active),
                enabled: true,
                onToggle: (value) {
                  settingsController.notificationsEnabled.value = value;
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                  title: 'Terms of Service', leading: Icon(Icons.description)),
              SettingsTile.switchTile(
                title: 'Enable Dark Mode',
                switchValue: settingsController.darkEnabled.value,
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
          CustomSection(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 8),
                  child: Image.asset(
                    'images/settings.png',
                    height: 50,
                    width: 50,
                    color: Color(0xFF777777),
                  ),
                ),
                Text(
                  'Version: 2.4.0 (287)',
                  style: TextStyle(color: Color(0xFF777777)),
                ),
              ],
            ),
          ),
        ],
      ));
}
