import 'package:flutter/material.dart';
import 'package:internet_checker_app/feature/settings/presentation/widget/build_setting_item.dart';

Widget buildSettingsContent() {
  return ListView(
    children: [
      buildSettingItem('Account Settings', Icons.account_circle),
      buildSettingItem('Notifications', Icons.notifications),
      buildSettingItem('Privacy', Icons.lock),
      buildSettingItem('Help & Support', Icons.help),
      buildSettingItem('About', Icons.info),
    ],
  );
}