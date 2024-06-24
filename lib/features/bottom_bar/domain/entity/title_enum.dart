import 'package:smart_tailor/core/constants/app_svg.dart';

enum NavBarTitle {
  marketplace(
    'Маркетплейс',
    AppSvg.shoppingCart,
  ),
  order(
    'Разместить заказ',
    AppSvg.list,
  ),
  organization(
    'Организация',
    AppSvg.buildings,
  ),
  profile(
    'Профиль',
    AppSvg.profile,
  );

  final String title;
  final String svg;
  const NavBarTitle(
    this.title,
    this.svg,
  );
}
