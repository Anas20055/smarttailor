import 'package:flutter/material.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/features/profile/presentation/pages/profie_page/widgets/profie_botton.dart';

class ProfileButtons extends StatelessWidget {
  final bool hasSubscription;
  const ProfileButtons({
    super.key,
    required this.hasSubscription,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ProfileButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRouteNames.personalInfoPage,
                arguments: hasSubscription,
              );
            },
            title: 'Личные данные',
          ),
          const SizedBox(
            height: 16,
          ),
          ProfileButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouteNames.myAnnouncementPage);
            },
            title: 'Мои объявления',
          ),
          const SizedBox(
            height: 16,
          ),
          ProfileButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouteNames.myPurchasesPage);
            },
            title: 'Мои покупки',
          ),
          const SizedBox(
            height: 16,
          ),
          if (hasSubscription)
            ProfileButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouteNames.historyPage);
              },
              title: 'История заказов',
            ),
          const SizedBox(
            height: 16,
          ),
          if (hasSubscription)
            ProfileButton(
              onPressed: () {},
              title: 'Организация',
            ),
        ],
      ),
    );
  }
}
