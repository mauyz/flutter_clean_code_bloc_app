import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/app/app_router.dart';
import 'package:cross_platform_app/presentation/form/form_controls.dart';
import 'package:cross_platform_app/presentation/onboarding/login/bloc/auth_bloc.dart';
import 'package:cross_platform_app/presentation/widgets/button/submit_button.dart';
import 'package:cross_platform_app/presentation/widgets/input/email_input.dart';
import 'package:cross_platform_app/presentation/widgets/input/password_input.dart';
import 'package:cross_platform_app/presentation/widgets/popup/display_snackbar.dart';
import 'package:cross_platform_app/services/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final form = FormGroup(
      {
        'email': FormControls.email,
        'password': FormControls.password,
      },
    );
    return Scaffold(
      body: Center(
        child: ReactiveForm(
          formGroup: form,
          child: SizedBox(
            width: 300,
            child: SingleChildScrollView(
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
                  BlocProvider<AuthBloc>(
                    create: (_) => getIt.get<AuthBloc>(),
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (_, state) {
                        if (state is AuthenticatedFailed) {
                          displaySnackBar(
                            context,
                            state.failure.message,
                            isErrorMessage: true,
                          );
                        }
                        if (state is Authenticated) {
                          context.router.popAndPush(
                            HomeRoute(user: state.user),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is UnAuthenticated ||
                            state is AuthenticatedFailed) {
                          return SubmitButton(
                            text: 'Log in',
                            onPressed: () {
                              if (form.valid) {
                                final email = form.control('email').value;
                                final password = form.control('password').value;
                                context.read<AuthBloc>().add(
                                      LogInEvent(
                                        email: email,
                                        password: password,
                                      ),
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
                      context.router.popAndPush(const RegisterRoute());
                    },
                    child: const Text(
                      'Register',
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
