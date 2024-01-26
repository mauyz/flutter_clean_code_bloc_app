import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/app/app_router.dart';
import 'package:cross_platform_app/presentation/form/form_controls.dart';
import 'package:cross_platform_app/presentation/onboarding/register/bloc/register_bloc.dart';
import 'package:cross_platform_app/presentation/responsive_widget.dart';
import 'package:cross_platform_app/presentation/widgets/button/submit_button.dart';
import 'package:cross_platform_app/presentation/widgets/input/confirm_password_input.dart';
import 'package:cross_platform_app/presentation/widgets/input/email_input.dart';
import 'package:cross_platform_app/presentation/widgets/input/name_input.dart';
import 'package:cross_platform_app/presentation/widgets/input/password_input.dart';
import 'package:cross_platform_app/presentation/widgets/popup/display_snackbar.dart';
import 'package:cross_platform_app/services/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final form = FormGroup(
      {
        'name': FormControls.name(),
        'email': FormControls.email(),
        'password': FormControls.password,
        'confirmPassword': FormControl<String>(),
      },
      validators: [
        const MustMatchValidator(
          'password',
          'confirmPassword',
          true,
        ),
      ],
    );
    return Scaffold(
      body: Center(
        child: Card(
          child: Padding(
            padding: ResponsiveWidget.isMobile(context)
                ? const EdgeInsets.all(20.0)
                : const EdgeInsets.symmetric(
                    horizontal: 100.0,
                    vertical: 30,
                  ),
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
                      BlocProvider<RegisterBloc>(
                        create: (_) => getIt.get<RegisterBloc>(),
                        child: BlocConsumer<RegisterBloc, RegisterState>(
                          listener: (_, state) {
                            if (state is RegisterFailed) {
                              displaySnackBar(
                                context,
                                state.failure.message,
                                isErrorMessage: true,
                              );
                            }
                            if (state is RegisterSuccess) {
                              context.router
                                  .replace(HomeRoute(user: state.user));
                            }
                          },
                          builder: (buildContext, state) {
                            if (state is RegisterInitial ||
                                state is RegisterFailed) {
                              return SubmitButton(
                                text: 'Register',
                                onPressed: () {
                                  if (form.valid) {
                                    final data = {
                                      "name": form.control("name").value,
                                      "email": form.control("email").value,
                                      "password":
                                          form.control("password").value,
                                    };
                                    buildContext.read<RegisterBloc>().add(
                                          RegisterEvent(data: data),
                                        );
                                  } else {
                                    form.markAllAsTouched();
                                  }
                                },
                              );
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          context.router.replace(const LoginRoute());
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
        ),
      ),
    );
  }
}
