import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/auth/widgets/login_button.dart';
import 'package:gymbuddies/presentation/common/widgets/input_textfield.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    const String welcomeAndLoginText =
        'Welcome back! Enter your\ne-mail and password:';
    const String emailInputLabel = 'E-Mail';
    const String passwordInputLabel = 'Password';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 10.0, left: 10.0, right: 10.0, bottom: 20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      welcomeAndLoginText,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const InputTextField(inputLabel: emailInputLabel),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const InputTextField(inputLabel: passwordInputLabel),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const LoginButton()
        ],
      ),
    );
  }
}
