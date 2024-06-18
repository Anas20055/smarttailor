import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_tailor/core/utils/validate_mixin.dart';
import 'package:smart_tailor/features/auth/presentation/pages/confirm_page/widgets/confirm_buttons.dart';
import 'package:smart_tailor/features/auth/presentation/pages/confirm_page/widgets/otp_form.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({super.key});

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> with FieldValidation {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  Timer? _timer;
  int _start = 59;
  bool _otpError = false;
  String _infoMessage = 'Отправлен 4-х значный код на указанную почту';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _timer?.cancel();

    super.dispose();
  }

  void _verifyOTP() {
    if (_formKey.currentState!.validate()) {
      String otp = _controllers.map((controller) => controller.text).join();
      // Perform OTP verification logic here
      bool isOtpCorrect = _checkOtp(otp); // Replace with actual OTP check
      if (isOtpCorrect) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP Verified: $otp')),
        );
      } else {
        setState(() {
          _otpError = true;
          _infoMessage = 'Код введен неверно, попробуйте еще раз';
        });
      }
    }
  }

  bool _checkOtp(String otp) {
    // Add your OTP verification logic here
    return otp == "1234"; // Example condition, replace with actual check
  }

  void startTimer() {
    _start = 59;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _resendCode() {
    setState(() {
      _otpError = false;
      _infoMessage = 'Отправлен 4-х значный код на указанную почту';
      for (var controller in _controllers) {
        controller.clear();
      }
    });
    startTimer();
    // Perform resend code logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Resending code...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Регистрация'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height - 115,
              child: Column(
                children: [
                  const SizedBox(height: 72),
                  SizedBox(
                    width: 225,
                    child: Text(
                      _infoMessage,
                      style: theme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 28),
                  OtpForm(
                    formKey: _formKey,
                    controllers: _controllers,
                    otpError: _otpError,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Отправить код повторно через',
                    style: theme.labelLarge,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    '00:${_start < 10 ? "0" : ""}$_start',
                    style: theme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
            ConfirmButtons(
              onPressed1: _verifyOTP,
              onPressed2: _start == 0 ? _resendCode : null,
            ),
          ],
        ),
      ),
    );
  }
}
