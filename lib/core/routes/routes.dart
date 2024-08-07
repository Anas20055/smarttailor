import 'package:flutter/material.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/features/auth/domain/entity/confirm_arguments.dart';
import 'package:smart_tailor/features/auth/presentation/pages/confirm_page/confirm_page.dart';
import 'package:smart_tailor/features/auth/presentation/pages/login_page/login_page.dart';
import 'package:smart_tailor/features/auth/presentation/pages/register_page/register_page.dart';
import 'package:smart_tailor/features/auth/presentation/pages/welocom_page/welcom_page.dart';
import 'package:smart_tailor/features/bottom_bar/presentation/pages/bottom_bar_page.dart';
import 'package:smart_tailor/features/organization/presentation/pages/create_organization_screen/create_organization_screen.dart';
import 'package:smart_tailor/features/profile/presentation/pages/history_page/history_page.dart';
import 'package:smart_tailor/features/profile/presentation/pages/my_announcements_page/my_announcements_page.dart';
import 'package:smart_tailor/features/profile/presentation/pages/my_announcements_page/pages/detail_announc_page.dart';
import 'package:smart_tailor/features/profile/presentation/pages/my_purchases_page/my_purchases_page.dart';
import 'package:smart_tailor/features/profile/presentation/pages/my_purchases_page/pages/detail_purchases_page.dart';
import 'package:smart_tailor/features/profile/presentation/pages/notifications_page/notifications_page.dart';
import 'package:smart_tailor/features/profile/presentation/pages/personal_info_page/personal_info_page.dart';

abstract class AppRoutes {
  static String? initialRoute(bool isAuth) =>
      isAuth ? AppRouteNames.homePage : AppRouteNames.welcome;
  static Route onGenerateRoutes(RouteSettings settings) {
    return switch (settings.name) {
      AppRouteNames.welcome => _materialRoute(const WelcomePage()),
      AppRouteNames.confirm => _materialRoute(
          ConfirmPage(
            confirmArguments: settings.arguments as ConfirmArguments,
          ),
        ),
      AppRouteNames.homePage => _materialRoute(BottomBarPage(
          index: settings.arguments as int?,
        )),
      AppRouteNames.notificationsPage =>
        _materialRoute(const NotifcationsPage()),
      AppRouteNames.register => _materialRoute(const RegisterPage()),
      AppRouteNames.login => _materialRoute(const LoginPage()),
      AppRouteNames.detailMyAnnounc => _materialRoute(
          DetailAnnouncPage(
            title: settings.arguments as String?,
          ),
        ),
      AppRouteNames.personalInfoPage => _materialRoute(
          PersonalInfoPage(
            hasSubscribtion: settings.arguments as bool,
          ),
        ),
      AppRouteNames.myAnnouncementPage =>
        _materialRoute(const MyAnnouncementPage()),
      AppRouteNames.myPurchasesPage => _materialRoute(const MyPurchasesPage()),
      AppRouteNames.detailPurchasePage =>
        _materialRoute(const DetailPurchasePage()),
      AppRouteNames.historyPage => _materialRoute(const HistoryPage()),
      AppRouteNames.createOrganizationPage =>
        _materialRoute(const CreateOrganizationScreen()),
      _ => _materialRoute(const WelcomePage()),
    };
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
