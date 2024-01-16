import 'package:cross_platform_app/app/app.dart';
import 'package:cross_platform_app/services/dependecy_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  configureDependecies();
  runApp(
    const App(),
  );
}
