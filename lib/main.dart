import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'themes/app_colors.dart';
import 'pages/home.dart';
import 'pages/explore.dart';
import 'pages/profile.dart';
import 'pages/settings.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Omnishare', home: const MainView());
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const ExplorePage(),
    const ProfilePage(),
    const SettingsPage()
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
        top: false,
        child: Scaffold(
            extendBody: true,
            backgroundColor: AppColors.mainBackground,
            bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                    iconTheme: const IconThemeData(color: Colors.white)),
                child: CurvedNavigationBar(
                    key: navigationKey,
                    color: AppColors.mainHover,
                    backgroundColor: AppColors.mainBackground,
                    buttonBackgroundColor: AppColors.mainAccent,
                    index: pageIndex,
                    height: 60,
                    items: menuItems,
                    onTap: (index) => setState(() {
                          pageIndex = index;
                        }))),
            body: pages[pageIndex]));
  }
}
