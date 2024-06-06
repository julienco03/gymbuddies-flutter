import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/common/themes/app_theme.dart';

class InputTextField extends StatelessWidget {
  final String inputLabel;
  const InputTextField({super.key, required this.inputLabel});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      cursorColor: Theme.of(context).iconTheme.color,
      decoration: InputDecoration(
        labelText: inputLabel,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.accentColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
