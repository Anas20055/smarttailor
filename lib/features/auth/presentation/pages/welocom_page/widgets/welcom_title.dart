import 'package:flutter/material.dart';
import 'package:smart_tailor/core/constants/app_images.dart';

class WelcomTitle extends StatelessWidget {
  const WelcomTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Positioned(
      top: 224,
      child: SizedBox(
        width: 393,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Column(
            children: [
              Image.asset(AppImages.imageTitle),
              const SizedBox(height: 36),
              Text(
                'SmartTailor',
                style: theme.headlineLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Мониторинг и управление швейным производством',
                style: theme.headlineMedium?.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
