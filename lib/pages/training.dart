import 'package:flutter/material.dart';
import 'package:gymbuddies/common_layout.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: Text("Training"),
      selectedIndex: 1,
    );
  }
}
