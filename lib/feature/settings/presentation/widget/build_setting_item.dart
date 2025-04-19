import 'package:flutter/material.dart';

Widget buildSettingItem(String title, IconData icon) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    trailing: const Icon(Icons.chevron_right),
    onTap: () {
      // Handle setting item tap
    },
  );
}