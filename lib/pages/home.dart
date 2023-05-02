import '../themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:omnishare_mobile/services/store.dart';
import 'package:omnishare_mobile/services/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final api = API();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBackground,
        body: Center(
          child: Column(children: [
            ElevatedButton(
                onPressed: () async {
                  final bool result = await api.dioLogin();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('The result of login is $result')));
                },
                child: Text("Login")),
            ElevatedButton(
                onPressed: () async {
                  final result = await api.dioGetData();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('The result of fetch is $result')));
                },
                child: Text("Fetch")),
            ElevatedButton(
                onPressed: () async {
                  await Store.clear();
                },
                child: Text("Clear Auth")),
          ]),
        ));
  }
}
