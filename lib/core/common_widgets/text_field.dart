// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smart_tailor/core/constants/app_colors.dart';

class MyTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String? hintText;
  final TextEditingController controller;
  final VoidCallback? onPressed;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final EdgeInsets? padding;
  final double? radius;
  final TextStyle? style;
  final TextStyle? errorStyle;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final TextAlign? textAlign;

  const MyTextField({
    super.key,
    this.validator,
    this.hintText,
    required this.controller,
    this.onPressed,
    this.onChanged,
    this.suffixIcon,
    this.padding,
    this.radius,
    this.style,
    this.errorStyle,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.textAlign,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.start,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      cursorErrorColor: Colors.red,
      cursorColor: Colors.black,
      style: style ?? Theme.of(context).textTheme.labelLarge,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 6),
          borderSide: const BorderSide(
            color: AppColors.grey,
            width: 1,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 6),
          borderSide: const BorderSide(
            color: AppColors.grey,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 6),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 6),
          borderSide: const BorderSide(
            color: AppColors.grey,
            width: 1,
          ),
        ),
        errorStyle: errorStyle ??
            const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.red,
            ),
        isDense: true,
        contentPadding:
            padding ?? const EdgeInsets.only(top: 13, left: 12, bottom: 10),
        hintText: hintText,
        hintStyle: null,
        suffixIcon: suffixIcon,
        counterText: '',
      ),
      validator: validator,
      controller: controller,
    );
  }
}
