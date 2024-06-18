// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:smart_tailor/core/constants/app_colors.dart';

class CheckBoxWidget extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final bool value;
  const CheckBoxWidget({
    super.key,
    this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 18,
          height: 18,
          child: Checkbox(
            side: const BorderSide(color: AppColors.grey),
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return AppColors.darkBlue;
              }
              return Colors.white;
            }),
            value: value,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 11),
        const Text('Запомнить меня'),
      ],
    );
  }
}
