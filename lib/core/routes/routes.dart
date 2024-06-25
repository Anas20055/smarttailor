import 'package:flutter/material.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/features/auth/presentation/pages/confirm_page/confirm_page.dart';
import 'package:smart_tailor/features/auth/presentation/pages/login_page/login_page.dart';
import 'package:smart_tailor/features/auth/presentation/pages/register_page/register_page.dart';
import 'package:smart_tailor/features/auth/presentation/pages/welocom_page/welcom_page.dart';
import 'package:smart_tailor/features/bottom_bar/presentation/pages/bottom_bar_page.dart';
import 'package:smart_tailor/features/profile/presentation/pages/notifications/notifications_page.dart';

abstract class AppRoutes {
  static String? initialRoute() => AppRouteNames.homePage;
  static Route onGenerateRoutes(RouteSettings settings) {
    return switch (settings.name) {
      AppRouteNames.welcome => _materialRoute(const WelcomePage()),
      AppRouteNames.confirm => _materialRoute(ConfirmPage(
          title: settings.arguments as String?,
        )),
      AppRouteNames.homePage => _materialRoute(const BottomBarPage()),
      AppRouteNames.notificationsPage =>
        _materialRoute(const NotifcationsPage()),
      AppRouteNames.register => _materialRoute(const RegisterPage()),
      AppRouteNames.login => _materialRoute(const LoginPage()),
      _ => _materialRoute(const WelcomePage()),
    };
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
