import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/providers/trainings_plan_provider.dart';

class TrainingPlanListWidget extends ConsumerWidget {
  const TrainingPlanListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainingPlans = ref.watch(trainingPlansProvider);

    return Expanded(
      child: ListView.builder(
        itemCount: trainingPlans.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(trainingPlans[index], style: TextStyle(color: Theme.of(context).primaryColor),),
          );
        },
      ),
    );
  }
}
