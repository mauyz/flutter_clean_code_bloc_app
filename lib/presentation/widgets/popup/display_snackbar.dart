import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> displaySnackBar(
    BuildContext context, String snackBarText,
    {bool? isErrorMessage, Duration? duration}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        snackBarText,
        style: isErrorMessage == true
            ? const TextStyle(
                color: Colors.red,
              )
            : null,
        textAlign: TextAlign.center,
      ),
      duration: duration ?? Duration(seconds: isErrorMessage == true ? 10 : 5),
      padding: const EdgeInsets.all(8.0),
    ),
  );
}
