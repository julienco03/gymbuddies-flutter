import 'package:flutter/material.dart';
import 'package:gymbuddies/common_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: Text("Home"),
      selectedIndex: 0,
    );
  }
}
