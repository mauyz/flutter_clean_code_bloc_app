import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  final String text;
  const ErrorTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15.0,
        color: Colors.red,
      ),
    );
  }
}
