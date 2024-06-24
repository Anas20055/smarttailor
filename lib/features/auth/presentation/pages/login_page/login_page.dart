import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_tailor/core/common_widgets/custom_button.dart';
import 'package:smart_tailor/core/common_widgets/text_field.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/constants/app_images.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/core/utils/validate_mixin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LogiPageState();
}

class _LogiPageState extends State<LoginPage> with FieldValidation {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        AppRouteNames.confirm,
        arguments: 'Авторизация',
      );
    }
  }

  void register() {
    Navigator.pushNamed(
      context,
      AppRouteNames.register,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 115),
                Image.asset(AppImages.imageTitle),
                const SizedBox(height: 60),
                Form(
                  key: _formKey,
                  child: MyTextField(
                    validator: validateEmail,
                    hintText: 'Введите электронный адрес',
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                    controller: emailController,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 50,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  CustomButton(
                    onPressed: login,
                    child: const Text('Войти'),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    color: AppColors.grey,
                    foregraundColor: AppColors.darkBlue,
                    borderColor: AppColors.grey,
                    onPressed: register,
                    child: const Text('Зарегистрироваться'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
