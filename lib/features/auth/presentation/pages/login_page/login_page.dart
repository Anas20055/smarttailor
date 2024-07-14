import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tailor/core/common_widgets/custom_button.dart';
import 'package:smart_tailor/core/common_widgets/loading.dart';
import 'package:smart_tailor/core/common_widgets/snack_bar.dart';
import 'package:smart_tailor/core/common_widgets/text_field.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/constants/app_images.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/core/utils/validate_mixin.dart';
import 'package:smart_tailor/features/auth/domain/entity/confirm_arguments.dart';
import 'package:smart_tailor/features/auth/presentation/pages/login_page/cubit/login_cubit.dart';

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
      context.read<LoginCubit>().login(emailController.text);
    }
  }

  void register() {
    Navigator.pushNamed(
      context,
      AppRouteNames.register,
    );
  }

  void authListener(context, state) {
    if (state is LoginError) {
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.customSnackBar(
        text: state.error!,
      ));
    } else if (state is LoginSuccess) {
      Navigator.pushNamed(
        context,
        AppRouteNames.confirm,
        arguments: ConfirmArguments(
          title: 'Авторизация',
          email: emailController.text,
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: authListener,
        builder: (context, state) {
          return Stack(
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
              if (state is LoginWaiting) const Loading(),
            ],
          );
        },
      ),
    );
  }
}
