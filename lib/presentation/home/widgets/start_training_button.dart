import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartTrainingButton extends StatelessWidget {
  const StartTrainingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push('/training/start');
      },
      child: const Text('START TRAINING'),
    );
  }
}
