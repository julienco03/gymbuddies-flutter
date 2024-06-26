import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrainingPlanItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final int trainingPlanId;

  const TrainingPlanItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.trainingPlanId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 28.0,
            onPressed: () {
              context.push('/training/ongoing-training');
            },
            padding: const EdgeInsets.only(right: 10.0),
          ),
          onTap: () {
            context.push('/training/detail/$trainingPlanId');
          },
        ),
      ),
    );
  }
}
