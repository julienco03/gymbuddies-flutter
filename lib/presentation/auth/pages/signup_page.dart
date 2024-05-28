import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/auth/widgets/signup_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gymbuddies'),
          // automaticallyImplyLeading: false,
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SignupForm(),
          ],
        ));
  }
}
