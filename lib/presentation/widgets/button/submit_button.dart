import 'package:flutter/material.dart';

class SubmitButton extends ElevatedButton {
  final String text;
  SubmitButton({
    super.key,
    required this.text,
    required super.onPressed,
  }) : super(
          child: Text(
            text,
          ),
        );
}
