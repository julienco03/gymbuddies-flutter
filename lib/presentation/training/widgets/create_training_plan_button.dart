import 'package:flutter/material.dart';

class CreateTrainingPlanButton extends StatelessWidget {
  const CreateTrainingPlanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 17.0,
      right: 17.0,
      child: FloatingActionButton(
        onPressed: () {
          // TODO: view drüberlegen (pushReplacementNamed) mit der man plan erstellen kann
        },
        child: const Icon(Icons.add), // Hintergrundfarbe des FABs
      ),
    );
  }
}
