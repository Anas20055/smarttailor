import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/constants/app_images.dart';

class MakeSubsButton extends StatelessWidget {
  final VoidCallback onMakeSubs;
  const MakeSubsButton({
    super.key,
    required this.onMakeSubs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 137,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Image.asset(AppImages.giftImage),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10,
                top: 14,
              ),
              child: Column(
                children: [
                  const Text(
                    'Оформите подписку,\nчтобы получить больше возможностей! С вами свяжется наш администратор 😉',
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: ElevatedButton(
                      onPressed: onMakeSubs,
                      style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        foregroundColor: MaterialStatePropertyAll(Colors.black),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 12)),
                        textStyle: MaterialStatePropertyAll(
                          TextStyle(fontSize: 14),
                        ),
                      ),
                      child: const Text('Отправить запрос'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
