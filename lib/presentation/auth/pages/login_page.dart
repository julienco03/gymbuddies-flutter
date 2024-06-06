import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/auth/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gymbuddies'),
        // automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LoginForm(),
          const SizedBox(
            height: 30.0,
          ),
          RichText(
            text: TextSpan(
              text: 'New here? ',
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: 'Register',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 12, 154, 55),
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, '/signup');
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
