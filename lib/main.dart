import 'package:cross_platform_app/app/app.dart';
import 'package:cross_platform_app/services/dependency_injection.dart';
import 'package:flutter/material.dart';

/// Starts and initializes the application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initializes all dependecies injection.
  await configureDependecies();
  runApp(
    const App(),
  );
}
