import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: 'email',
      validationMessages: {
        ValidationMessage.required: (_) => 'The email must not be empty',
        ValidationMessage.email: (_) => 'The email is not valid',
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        labelText: "Email",
        prefixIcon: Icon(
          Icons.email,
        ),
      ),
    );
  }
}
