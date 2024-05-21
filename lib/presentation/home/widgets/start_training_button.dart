import 'package:flutter/material.dart';

class StartTrainingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StartTrainingButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('START TRAINING'),
    );
  }
}
