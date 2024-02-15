import 'package:cross_platform_app/presentation/styles/decorations.dart';
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
      decoration: Decorations.roundedBorderInpuitDecoration(
        "Name",
        prefixIcon: Icons.person,
      ),
    );
  }
}
