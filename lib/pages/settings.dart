import '../services/store.dart';
import '../themes/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBackground,
        body: Center(
          child: ElevatedButton(
                onPressed: () async {
                  await Store.clear();
                },
                child: const Text("Log out")),
        ));
  }
}
