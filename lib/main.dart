import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'themes/app_colors.dart';

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
  int page = 0;
  final menuItems = const <Widget>[
    Icon(Icons.home, size: 30, color: Colors.white),
    Icon(Icons.search, size: 30, color: Colors.white),
    Icon(Icons.person, size: 30, color: Colors.white),
    Icon(Icons.settings, size: 30, color: Colors.white),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.mainBackground,
        bottomNavigationBar: CurvedNavigationBar(
            color: AppColors.mainHover,
            backgroundColor: AppColors.mainBackground,
            buttonBackgroundColor: AppColors.mainAccent,
            index: page,
            height: 60,
            items: menuItems,
            onTap: (index) => setState(() {
                  page = index;
                })),
        body: Center(
          child: Text(page.toString()),
        ));
  }
}
