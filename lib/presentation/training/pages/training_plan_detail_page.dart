import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/common/widgets/app_bar.dart';
import 'package:gymbuddies/presentation/training/widgets/training_plan_detail_view.dart';

class TrainingPlanDetailPage extends StatefulWidget {
  final int trainingPlanId;
  const TrainingPlanDetailPage({super.key, required this.trainingPlanId});

  @override
  TrainingPlanPageState createState() => TrainingPlanPageState();
}

class TrainingPlanPageState extends State<TrainingPlanDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: TrainingPlanDetailView(
        trainingPlanId: 1,
      ),
    );
  }
}
