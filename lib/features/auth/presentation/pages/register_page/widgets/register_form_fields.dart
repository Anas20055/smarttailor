import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smart_tailor/core/common_widgets/text_field.dart';
import 'package:smart_tailor/features/auth/domain/entity/register_enum.dart';

class RegisterFormFields extends StatelessWidget {
  const RegisterFormFields({
    super.key,
    required GlobalKey<FormState> formKey,
    required Map<FieldType, ValueNotifier<bool>> isFieldEmpty,
    required Map<FieldType, TextEditingController> controllers,
  })  : _formKey = formKey,
        _isFieldEmpty = isFieldEmpty,
        _controllers = controllers;

  final GlobalKey<FormState> _formKey;
  final Map<FieldType, ValueNotifier<bool>> _isFieldEmpty;
  final Map<FieldType, TextEditingController> _controllers;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Form(
      key: _formKey,
      child: Column(
        children: List.generate(
          FieldType.values.length,
          (index) {
            FieldType fieldType = FieldType.values[index];
            return ValueListenableBuilder<bool>(
              valueListenable: _isFieldEmpty[fieldType]!,
              builder: (context, isEmpty, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fieldType.label,
                      style: theme.labelLarge?.copyWith(
                        fontSize: isEmpty ? null : 14,
                        color: isEmpty ? null : Colors.black.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(height: isEmpty ? 11.5 : 8),
                    MyTextField(
                      errorStyle: fieldType == FieldType.phone ||
                              fieldType == FieldType.email
                          ? null
                          : const TextStyle(height: 0),
                      inputFormatters: fieldType == FieldType.phone
                          ? [
                              FilteringTextInputFormatter.digitsOnly,
                              MaskTextInputFormatter(
                                  mask: '+### ### ### ###',
                                  filter: {"#": RegExp(r'[0-9]')},
                                  type: MaskAutoCompletionType.lazy),
                            ]
                          : null,
                      validator: (value) => fieldType.validate(value),
                      controller: _controllers[fieldType]!,
                      keyboardType: fieldType == FieldType.phone
                          ? TextInputType.phone
                          : null,
                    ),
                    const SizedBox(height: 15.5),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
