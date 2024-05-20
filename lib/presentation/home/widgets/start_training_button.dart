import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/common/themes/app_theme.dart';
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
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentColor,
          side: const BorderSide(color: AppColors.accentColor, width: 3),
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)),
      child: Text(
        'START TRAINING',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
