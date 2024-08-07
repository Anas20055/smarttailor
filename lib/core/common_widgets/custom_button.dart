// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smart_tailor/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? foregraundColor;
  final Color? disabledColor;
  final Color? disabledForegraundColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  const CustomButton({
    super.key,
    required this.child,
    this.onPressed,
    this.color = AppColors.darkBlue,
    this.foregraundColor = Colors.white,
    this.disabledColor = AppColors.grey,
    this.disabledForegraundColor = AppColors.darkBlue,
    this.borderColor = AppColors.darkBlue,
    this.textStyle,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(textStyle),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 14)),
            side: BorderSide(color: borderColor!),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledColor!;
            }
            return color!;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledForegraundColor!;
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
