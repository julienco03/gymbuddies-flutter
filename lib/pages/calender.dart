import 'package:flutter/material.dart';
import 'package:gymbuddies/common_layout.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: Text("Calender"),
      selectedIndex: 2,
    );
  }
}
