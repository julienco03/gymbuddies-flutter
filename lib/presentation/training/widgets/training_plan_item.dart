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
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Handle edit action
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // Handle delete action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
