import 'package:flutter/material.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/features/auth/presentation/pages/confirm_page/confirm_page.dart';
import 'package:smart_tailor/features/auth/presentation/pages/login_page/login_page.dart';
import 'package:smart_tailor/features/auth/presentation/pages/register_page/register_page.dart';
import 'package:smart_tailor/features/auth/presentation/pages/welocom_page/welcom_page.dart';

abstract class AppRoutes {
  static String? initialRoute() => AppRouteNames.confirm;
  static Route onGenerateRoutes(RouteSettings settings) {
    return switch (settings.name) {
      AppRouteNames.confirm => _materialRoute(const ConfirmPage()),
      AppRouteNames.welcome => _materialRoute(const WelcomePage()),
      AppRouteNames.register => _materialRoute(const RegisterPage()),
      AppRouteNames.login => _materialRoute(const LoginPage()),
      // AppRouteNames.detailScreen =>
      //   _materialRoute(ReciepDetailScreen(id: settings.arguments as int)),

      _ => _materialRoute(const RegisterPage()),
    };
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
