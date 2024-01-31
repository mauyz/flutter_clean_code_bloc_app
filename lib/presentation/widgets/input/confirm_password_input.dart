import 'package:cross_platform_app/presentation/styles/decorations.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ConfirmPasswordInput extends StatefulWidget {
  const ConfirmPasswordInput({super.key});

  @override
  State<ConfirmPasswordInput> createState() => _ConfirmPasswordInputState();
}

class _ConfirmPasswordInputState extends State<ConfirmPasswordInput> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: 'confirmPassword',
      obscureText: obscurePassword,
      validationMessages: {
        ValidationMessage.mustMatch: (_) =>
            'The password confirmation does not match on the password',
      },
      textInputAction: TextInputAction.done,
      decoration: Decorations.roundedBorderInpuitDecoration(
        "Confirm password",
        prefixIcon: Icons.lock,
        suffixIcon: TextButton(
          onPressed: () {
            if (mounted) {
              setState(() => obscurePassword = !obscurePassword);
            }
          },
          child: Icon(
            obscurePassword ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
