import 'package:cross_platform_app/app/app.dart';
import 'package:cross_platform_app/services/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  await configureDependecies();
  runApp(
    const App(),
  );
}
