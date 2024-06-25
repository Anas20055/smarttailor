import 'package:flutter/material.dart';
import 'package:smart_tailor/features/profile/presentation/pages/widgets/profie_botton.dart';

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
            onPressed: () {},
            title: 'Личные данные',
          ),
          const SizedBox(
            height: 16,
          ),
          ProfileButton(
            onPressed: () {},
            title: 'Мои объявления',
          ),
          const SizedBox(
            height: 16,
          ),
          ProfileButton(
            onPressed: () {},
            title: 'Мои покупки',
          ),
          const SizedBox(
            height: 16,
          ),
          hasSubscription
              ? ProfileButton(
                  onPressed: () {},
                  title: 'История заказов',
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
