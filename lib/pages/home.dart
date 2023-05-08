import '../themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:omnishare_mobile/services/store.dart';
import 'package:omnishare_mobile/services/api.dart';

import '../widgets/posts/post.dart';

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
          child: ListView(children: const [
            Post(),
            Post(),
            Post(),
            Post(),
            Post(),
            Post(),
          ]),
        ));
  }
}
