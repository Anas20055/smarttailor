import 'package:flutter/material.dart';
import 'package:smart_tailor/core/routes/routes.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
part "core/theme/theme.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute(),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: _theme(),
    );
  }
}
