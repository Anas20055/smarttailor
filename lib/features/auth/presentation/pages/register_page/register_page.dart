import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_tailor/core/common_widgets/custom_button.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/features/auth/domain/entity/register_enum.dart';
import 'package:smart_tailor/features/auth/presentation/pages/register_page/widgets/register_check_box.dart';
import 'package:smart_tailor/features/auth/presentation/pages/register_page/widgets/register_form_fields.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<FieldType, TextEditingController> _controllers = {
    for (var type in FieldType.values) type: TextEditingController()
  };
  final Map<FieldType, ValueNotifier<bool>> _isFieldEmpty = {
    for (var type in FieldType.values) type: ValueNotifier<bool>(true)
  };
  final ValueNotifier<bool> _isButtonEnabled = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _controllers.forEach((type, controller) {
      controller.addListener(() {
        _isFieldEmpty[type]!.value = controller.text.isEmpty;
        _updateButtonState();
      });
    });
  }

  void _updateButtonState() {
    bool allFieldsFilled =
        _controllers.values.any((controller) => controller.text.isNotEmpty);
    _isButtonEnabled.value = allFieldsFilled;
  }

  @override
  void dispose() {
    _controllers.forEach((key, controller) => controller.dispose());
    _isFieldEmpty.forEach((key, notifier) => notifier.dispose());
    _isButtonEnabled.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRouteNames.confirm);
    }
  }

  bool _isChecked = false;

  void _updateCheckbox(bool? value) {
    setState(() {
      _isChecked = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: AppColors.backColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 111),
                  Text(
                    'Регистрация',
                    style: theme.headlineSmall,
                  ),
                  const SizedBox(height: 32),
                  RegisterFormFields(
                    formKey: _formKey,
                    isFieldEmpty: _isFieldEmpty,
                    controllers: _controllers,
                  ),
                  CheckBoxWidget(
                    value: _isChecked,
                    onChanged: _updateCheckbox,
                  ),
                ],
              ),
            ),
            registerButton(context),
            backButton(context),
          ],
        ),
      ),
    );
  }

  Positioned backButton(BuildContext context) {
    return Positioned(
      top: 59,
      left: 8,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 22,
        ),
      ),
    );
  }

  Widget registerButton(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 50,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: ValueListenableBuilder<bool>(
          valueListenable: _isButtonEnabled,
          builder: (context, isEnabled, child) {
            return CustomButton(
              onPressed: isEnabled ? _submit : null,
              child: const Text('Зарегистрироваться'),
            );
          },
        ),
      ),
    );
  }
}
