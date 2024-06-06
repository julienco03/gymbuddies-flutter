import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/auth/widgets/signup_button.dart';
import 'package:gymbuddies/presentation/common/widgets/input_textfield.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    const String enterEmailLabel = 'Enter your E-Mail';
    const String emailInputLabel = 'E-Mail';
    const String enterPasswordLabel = 'Enter your Password';
    const String passwordInputLabel = 'Password';
    const String repeatPasswordInputLabel = 'Repeat Password';

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      enterEmailLabel,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const InputTextField(inputLabel: emailInputLabel),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      enterPasswordLabel,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const InputTextField(inputLabel: passwordInputLabel),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const InputTextField(inputLabel: repeatPasswordInputLabel),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const SignupButton(),
        ],
      ),
    );
  }
}
