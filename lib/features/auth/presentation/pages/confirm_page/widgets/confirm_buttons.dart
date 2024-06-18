import 'package:flutter/material.dart';
import 'package:smart_tailor/core/common_widgets/custom_button.dart';

class ConfirmButtons extends StatelessWidget {
  final VoidCallback onPressed1;
  final VoidCallback? onPressed2;
  const ConfirmButtons({
    super.key,
    required this.onPressed1,
    required this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - 32,
        child: Column(
          children: [
            CustomButton(
              onPressed: onPressed1,
              child: const Text('Войти'),
            ),
            const SizedBox(height: 16),
            CustomButton(
              disabledColor: Colors.white,
              onPressed: onPressed2,
              child: const Text('Отправить код повторно'),
            ),
          ],
        ),
      ),
    );
  }
}
