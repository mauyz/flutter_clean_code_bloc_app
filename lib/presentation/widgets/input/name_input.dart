import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: 'name',
      validationMessages: {
        ValidationMessage.required: (_) => 'The name must not be empty',
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        labelText: "Name",
        prefixIcon: Icon(
          Icons.person,
        ),
      ),
    );
  }
}
