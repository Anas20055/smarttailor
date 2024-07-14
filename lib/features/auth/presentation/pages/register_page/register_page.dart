import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tailor/core/common_widgets/custom_button.dart';
import 'package:smart_tailor/core/common_widgets/loading.dart';
import 'package:smart_tailor/core/common_widgets/snack_bar.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/features/auth/domain/entity/confirm_arguments.dart';
import 'package:smart_tailor/features/auth/domain/entity/register_enum.dart';
import 'package:smart_tailor/features/auth/domain/entity/register_request.dart';
import 'package:smart_tailor/features/auth/presentation/pages/register_page/cubit/register_cubit.dart';
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
      context.read<RegisterCubit>().register(RegisterRequest(
            email: _controllers[FieldType.email]!.text,
            name: _controllers[FieldType.name]!.text,
            patronymic: _controllers[FieldType.midname]!.text,
            surname: _controllers[FieldType.surname]!.text,
            phoneNumber:
                _controllers[FieldType.phone]!.text.replaceAll(' ', ''),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(''),
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: authListener,
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: defaultTargetPlatform == TargetPlatform.iOS
                          ? 115
                          : 80,
                    ),
                    Text(
                      'Регистрация',
                      style: theme.headlineSmall,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 32),
                            RegisterFormFields(
                              formKey: _formKey,
                              isFieldEmpty: _isFieldEmpty,
                              controllers: _controllers,
                            ),
                            const SizedBox(height: 100),
                            registerButton(context),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (state is RegisterWaiting) const Loading(),
            ],
          );
        },
      ),
    );
  }

  void authListener(context, state) {
    if (state is RegisterError) {
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.customSnackBar(
        text: state.error!,
      ));
    } else if (state is RegisterSuccess) {
      Navigator.pushNamed(context, AppRouteNames.confirm,
          arguments:
              ConfirmArguments(email: _controllers[FieldType.email]!.text));
    }
  }

  Widget registerButton(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isButtonEnabled,
      builder: (context, isEnabled, child) {
        return CustomButton(
          borderColor: AppColors.grey,
          onPressed: isEnabled ? _submit : null,
          child: const Text('Зарегистрироваться'),
        );
      },
    );
  }
}
