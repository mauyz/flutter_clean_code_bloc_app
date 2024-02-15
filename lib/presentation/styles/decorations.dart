import 'package:flutter/material.dart';

class Decorations {
  const Decorations._();

  static InputDecoration roundedBorderInpuitDecoration(
    String labelText, {
    double? radius,
    IconData? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius ?? 8.0,
          ),
        ),
      ),
      prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
      suffixIcon: suffixIcon,
      errorMaxLines: 2,
    );
  }
}
