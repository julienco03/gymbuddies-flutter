import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/training/widgets/training_plan_item_widget.dart';

class TrainingPlanListWidget extends StatelessWidget {
  const TrainingPlanListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List.generate(
                  10,
                  (index) => TrainingPlanItem(
                    title: 'Training Plan ${index + 1}',
                    subtitle: '1:30h | last trained: 5 May',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
