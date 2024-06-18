mixin FieldValidation {
  String? validateIsEmpty(String? value) {
    if (value?.isEmpty == true) {
      return '';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value?.isEmpty == true) {
      return 'Почта не может быть пустой';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
      return 'Введите действительный адрес электронной почты';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value?.isEmpty == true) {
      return 'Номер телефона не может быть пустым';
    }
    if (!RegExp(r'^\+\d{3}\s\d{3}\s\d{3}\s\d{3}$').hasMatch(value!)) {
      return 'Введите действительный номер телефона';
    }
    return null;
  }
}
