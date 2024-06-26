import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.go('/home');
      },
      child: const Text('SIGN UP'),
    );
  }
}
