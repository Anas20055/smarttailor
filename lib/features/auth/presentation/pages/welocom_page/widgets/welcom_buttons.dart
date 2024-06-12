import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_tailor/core/common_widgets/custom_button.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';

class WelcomeButtons extends StatelessWidget {
  final VoidCallback onSingIn;
  final VoidCallback onSingUp;
  const WelcomeButtons({
    super.key,
    required this.onSingIn,
    required this.onSingUp,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - 32,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: onSingIn,
              child: const Text('Войти'),
            ),
            const SizedBox(height: 16),
            CustomButton(
              color: AppColors.grey,
              foregraundColor: AppColors.darkBlue,
              onPressed: onSingUp,
              child: const Text('Зарегистрироваться'),
            )
          ],
        ),
      ),
    );
  }
}
