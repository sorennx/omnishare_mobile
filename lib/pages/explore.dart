import '../themes/app_colors.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePage();
}

class _ExplorePage extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBackground,
        body: const Center(
          child: Text("Explore"),
        ));
  }
}
