// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? foregraundColor;
  const CustomButton({
    super.key,
    required this.child,
    this.onPressed,
    this.color = AppColors.darkBlue,
    this.foregraundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.grey;
            }
            return color!;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.darkBlue;
            }
            return foregraundColor!;
          },
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
