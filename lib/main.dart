import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:omnishare_mobile/services/store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'themes/app_colors.dart';
import 'pages/home.dart';
import 'pages/explore.dart';
import 'pages/profile.dart';
import 'pages/settings.dart';
import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Store.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Omnishare',
        home: const MainView(),
        theme: ThemeData(
            textTheme: TextTheme(
                bodyLarge: TextStyle(
                    color:
                        AppColors.mainText), // Set text color for all body text
                bodyMedium: TextStyle(
                    color: AppColors
                        .mainText), // Set text color for all secondary body text
                titleLarge: TextStyle(color: AppColors.mainText))));
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => MainViewState();
}

final navigationKey = GlobalKey<CurvedNavigationBarState>();
final navigationKey2 = GlobalKey<CurvedNavigationBarState>();

class MainViewState extends State<MainView> {
  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const ExplorePage(),
    const ProfilePage(),
    const SettingsPage(),
  ];

  final menuItems = const <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.search, size: 30),
    Icon(Icons.person, size: 30),
    Icon(Icons.settings, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      backgroundColor: AppColors.mainBackground,
      bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: ValueListenableBuilder<bool>(
              valueListenable: Store.isAuthNotifier,
              builder: (context, isAuth, _) {
                return isAuth == false
                    ? CurvedNavigationBar(
                        key: navigationKey2,
                        color: AppColors.mainHover,
                        backgroundColor: AppColors.mainBackground,
                        buttonBackgroundColor: AppColors.mainAccent,
                        height: 60,
                        items: const [Icon(Icons.login, size: 30)])
                    : CurvedNavigationBar(
                        key: navigationKey,
                        color: AppColors.mainHover,
                        backgroundColor: AppColors.mainBackground,
                        buttonBackgroundColor: AppColors.mainAccent,
                        index: pageIndex,
                        height: 60,
                        items: menuItems,
                        onTap: (index) => setState(() {
                              pageIndex = index;
                            }));
              })),
      body: ValueListenableBuilder<bool>(
          valueListenable: Store.isAuthNotifier,
          builder: (context, isAuth, _) {
            return isAuth == false ? const LoginPage() : pages[pageIndex];
          }),
    ));
  }
}
