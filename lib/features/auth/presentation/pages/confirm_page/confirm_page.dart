import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_tailor/core/common_widgets/text_field.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({super.key});

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  Timer? _timer;
  int _start = 59;

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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verifying OTP: $otp')),
      );
    }
  }

  void startTimer() {
    _start = 60;
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
      body: Column(
        children: [
          const SizedBox(height: 72),
          SizedBox(
            width: 225,
            child: Text(
              'Отправлен 4-х значный код на указанную почту',
              style: theme.labelLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 28),
          Form(
            key: _formKey,
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
                          controller: _controllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
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
          ),
          const SizedBox(height: 24),
          Text(
            'Отправить код повторно через',
            style: theme.labelLarge,
          ),
          Text('00:${_start < 10 ? "0" : ""}$_start'),
          ElevatedButton(
            onPressed: _verifyOTP,
            child: const Text('Verify OTP'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _start == 0 ? _resendCode : null,
            child: const Text('Resend Code'),
          ),
        ],
      ),
    );
  }
}
