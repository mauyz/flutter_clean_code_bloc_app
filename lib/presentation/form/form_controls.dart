import 'package:reactive_forms/reactive_forms.dart';

class FormControls {
  const FormControls._();

  static final email = FormControl<String>(
    validators: [
      Validators.required,
      Validators.email,
    ],
  );

  static final name = FormControl<String>(
    validators: [
      Validators.required,
    ],
  );

  static final password = FormControl<String>(
    validators: [
      Validators.required,
    ],
  );
}
