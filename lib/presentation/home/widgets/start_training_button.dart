import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/training/pages/start_training_page.dart';

class StartTrainingButton extends StatelessWidget {
  const StartTrainingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/training/start');
      },
      child: const Text('START TRAINING'),
    );
  }
}
