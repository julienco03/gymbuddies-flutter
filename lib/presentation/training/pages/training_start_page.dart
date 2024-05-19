import 'package:flutter/material.dart';

class TrainingStartPage extends StatelessWidget {
  final String trainingPlanId;

  const TrainingStartPage({super.key, required this.trainingPlanId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Start Training'),
        ),
        body: null);
  }
}
