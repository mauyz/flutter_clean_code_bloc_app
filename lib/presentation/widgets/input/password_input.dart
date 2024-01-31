import 'package:cross_platform_app/presentation/styles/decorations.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: 'password',
      obscureText: obscurePassword,
      validationMessages: {
        ValidationMessage.required: (_) => 'The password must not be empty',
      },
      textInputAction: TextInputAction.done,
      decoration: Decorations.roundedBorderInpuitDecoration(
        "Password",
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
