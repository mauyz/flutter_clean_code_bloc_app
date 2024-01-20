import 'package:reactive_forms/reactive_forms.dart';

class FormControls {
  const FormControls._();

  static email({String? defaultValue}) => FormControl<String>(
        value: defaultValue,
        validators: [
          Validators.required,
          Validators.email,
        ],
      );

  static name({String? defaultValue}) => FormControl<String>(
        value: defaultValue,
        validators: [
          Validators.required,
        ],
      );

  static get password => FormControl<String>(
        validators: [
          Validators.required,
        ],
      );
}
