import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/training/widgets/training_plan_detail_view.dart';

class TrainingPlanDetailPage extends StatefulWidget {
  final int trainingPlanId;
  const TrainingPlanDetailPage({super.key, required this.trainingPlanId});

  @override
  TrainingPlanDetailPageState createState() => TrainingPlanDetailPageState();
}

class TrainingPlanDetailPageState extends State<TrainingPlanDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TrainingPlanDetailView(trainingPlanId: widget.trainingPlanId),
    );
  }
}
