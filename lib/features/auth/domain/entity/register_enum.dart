import 'package:smart_tailor/core/utils/validate_mixin.dart';

enum FieldType with FieldValidation {
  username('Фамилия*'),
  name('Имя*'),
  midname('Отчество*'),
  email('Почта*'),
  phone('Номер телефона*');

  final String label;

  const FieldType(this.label);

  String? validate(String? value) {
    return switch (this) {
      FieldType.username => validateUsername(value),
      FieldType.name => validateName(value),
      FieldType.midname => validateMidname(value),
      FieldType.email => validateEmail(value),
      FieldType.phone => validatePhone(value)
    };
  }
}
