import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/presentation/widgets/button/submit_button.dart';
import 'package:cross_platform_app/presentation/widgets/input/email_input.dart';
import 'package:cross_platform_app/presentation/widgets/input/password_input.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final form = FormGroup(
      {
        'email': FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
          ],
        ),
        'password': FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
      },
    );
    return Scaffold(
      body: Center(
        child: ReactiveForm(
          formGroup: form,
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const EmailInput(),
                const SizedBox(
                  height: 20,
                ),
                const PasswordInput(),
                const SizedBox(
                  height: 30,
                ),
                SubmitButton(
                  text: 'Log in',
                  onPressed: () {
                    if (form.valid) {
                      //todo
                    } else {
                      form.markAllAsTouched();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
