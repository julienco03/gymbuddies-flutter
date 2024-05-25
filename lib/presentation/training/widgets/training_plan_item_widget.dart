import 'package:flutter/material.dart';

class TrainingPlanItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const TrainingPlanItem(
      {super.key, required this.title, required this.subtitle});

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
              // Handle edit action
            },
            padding: const EdgeInsets.only(right: 10.0),
          ),
        ),
      ),
    );
  }
}
