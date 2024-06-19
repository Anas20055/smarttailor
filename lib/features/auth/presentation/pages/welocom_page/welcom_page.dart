import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_tailor/core/constants/app_images.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/features/auth/presentation/pages/welocom_page/widgets/welcom_buttons.dart';
import 'package:smart_tailor/features/auth/presentation/pages/welocom_page/widgets/welcom_title.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.backImage,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
            const WelcomTitle(),
            WelcomeButtons(
              onSingIn: onSingIn,
              onSingUp: onSingUp,
            ),
          ],
        ),
      ),
    );
  }

  void onSingIn() {
    Navigator.pushNamed(context, AppRouteNames.login);
  }

  void onSingUp() {
    Navigator.pushNamed(context, AppRouteNames.register);
  }
}
