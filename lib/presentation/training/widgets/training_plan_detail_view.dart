import 'package:flutter/material.dart';

class TrainingPlanDetailView extends StatelessWidget {
  final int trainingPlanId;
  const TrainingPlanDetailView({super.key, required this.trainingPlanId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Day'),
      ),
      body: null,
    );
  }
}
