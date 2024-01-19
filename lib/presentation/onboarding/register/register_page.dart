import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/app/app_router.dart';
import 'package:cross_platform_app/presentation/form/form_controls.dart';
import 'package:cross_platform_app/presentation/widgets/button/submit_button.dart';
import 'package:cross_platform_app/presentation/widgets/input/confirm_password_input.dart';
import 'package:cross_platform_app/presentation/widgets/input/email_input.dart';
import 'package:cross_platform_app/presentation/widgets/input/name_input.dart';
import 'package:cross_platform_app/presentation/widgets/input/password_input.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final form = FormGroup({
      'name': FormControls.name,
      'email': FormControls.email,
      'password': FormControls.password,
      'confirmPassword': FormControl<String>(),
    }, validators: [
      const MustMatchValidator(
        'password',
        'confirmPassword',
        true,
      ),
    ]);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: ReactiveForm(
            formGroup: form,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const NameInput(),
                  const SizedBox(
                    height: 20,
                  ),
                  const EmailInput(),
                  const SizedBox(
                    height: 20,
                  ),
                  const PasswordInput(),
                  const SizedBox(
                    height: 20,
                  ),
                  const ConfirmPasswordInput(),
                  const SizedBox(
                    height: 30,
                  ),
                  SubmitButton(
                    text: 'Register',
                    onPressed: () {
                      if (form.valid) {
                        // TODO register
                      } else {
                        form.markAllAsTouched();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      context.router.popAndPush(const LoginRoute());
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
