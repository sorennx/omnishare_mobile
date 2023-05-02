import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:omnishare_mobile/services/store.dart';
import 'themes/app_colors.dart';
import 'pages/home.dart';
import 'pages/explore.dart';
import 'pages/profile.dart';
import 'pages/settings.dart';
import 'pages/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Omnishare', home: MainView());
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

final navigationKey = GlobalKey<CurvedNavigationBarState>();

class _MainViewState extends State<MainView> {
  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const ExplorePage(),
    const ProfilePage(),
    const SettingsPage(),
    const LoginPage()
  ];

  final menuItems = const <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.search, size: 30),
    Icon(Icons.person, size: 30),
    Icon(Icons.settings, size: 30),
    Icon(Icons.login, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            body: FutureBuilder<String?>(
              future: Store.getToken(),
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Text('Error');
                } else {
                  if (snapshot.data == "TOKEN" || snapshot.data == null) {
                    return pages[4];
                  } else {
                    return pages[pageIndex];
                  }
                }
              },
            )));
  }
}
