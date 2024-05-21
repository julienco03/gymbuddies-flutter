import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/training/pages/training_start_page.dart';

class StartTrainingButton extends StatelessWidget {
  const StartTrainingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder<TrainingStartPage>(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const TrainingStartPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 200),
          ),
        );
      },
      child: const Text(
        'START TRAINING',
      ),
    );
  }
}
