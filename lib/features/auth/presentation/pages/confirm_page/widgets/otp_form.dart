import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_tailor/core/common_widgets/text_field.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/utils/validate_mixin.dart';

class OtpForm extends StatelessWidget with FieldValidation {
  final Key formKey;
  final List<TextEditingController> controllers;
  final bool otpError;
  const OtpForm({
    super.key,
    required this.formKey,
    required this.controllers,
    required this.otpError,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) {
            return Row(
              children: [
                SizedBox(
                  width: 34,
                  child: MyTextField(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    controller: controllers[index],
                    validator: validateIsEmpty,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    borderColor: otpError ? Colors.red : AppColors.grey,
                    onChanged: (value) {
                      if (value.length == 1 && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: index < 3 ? 20 : 0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
