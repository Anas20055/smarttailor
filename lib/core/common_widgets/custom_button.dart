// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? foregraundColor;
  const CustomButton({
    super.key,
    required this.child,
    this.onPressed,
    this.color,
    this.foregraundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color),
          foregroundColor: MaterialStatePropertyAll(foregraundColor)),
      onPressed: onPressed,
      child: child,
    );
  }
}
