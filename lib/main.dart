import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_tailor/core/routes/routes.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
part "core/theme/theme.dart";

void main() {
  final runnableApp = _buildRunnableApp(
    isWeb: kIsWeb,
    webAppWidth: 393.0,
    app: const MyApp(),
  );

  runApp(runnableApp);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: _theme());
  }
}

Widget _buildRunnableApp({
  required bool isWeb,
  required double webAppWidth,
  required Widget app,
}) {
  if (!isWeb) {
    return app;
  }
  if (webAppWidth < 400) {
    return app;
  }
  return Center(
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      child: SizedBox(
        height: 852,
        width: webAppWidth,
        child: app,
      ),
    ),
  );
}
