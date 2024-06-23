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
          physics: const ClampingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 8.0, bottom: 100.0),
              child: Column(
                children: List.generate(
                  10,
                  (index) => TrainingPlanItem(
                    title: 'Training Plan ${index + 1}',
                    subtitle: '1:30h | last trained: 5 May',
                    trainingPlanId: 0,
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
