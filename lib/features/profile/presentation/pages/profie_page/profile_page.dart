import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tailor/core/common_widgets/adaptive_diolog.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/features/auth/presentation/pages/confirm_page/cubit/confirm_otp_cubit.dart';
import 'package:smart_tailor/features/profile/presentation/pages/profie_page/widgets/profile_buttons.dart';
import 'package:smart_tailor/features/profile/presentation/widgets/make_subs_button.dart';
import 'package:smart_tailor/features/profile/presentation/widgets/profile_title.dart';

class ProfilePage extends StatefulWidget {
  final bool hasSubscribtion;
  const ProfilePage({
    super.key,
    required this.hasSubscribtion,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void onSingOut() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AdaptiveAlertDiolog(
          title: 'Вы действительно хотите выйти?',
          button1: 'Закрыть',
          onPressed1: () {
            Navigator.pop(context);
          },
          button2: 'Да',
          onPressed2: () {
            context.read<ConfirmOtpCubit>().logout();
            Navigator.pushReplacementNamed(
              context,
              AppRouteNames.welcome,
            );
          },
        );
      },
    );
  }

  bool isMakeSubs = false;
  void onMakeSubs() {
    setState(() {
      isMakeSubs = !isMakeSubs;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AdaptiveAlertDiolog(
            title: 'Ура! 🎉',
            content: 'Подписка уже в пути!',
            button1: 'Понятно',
            onPressed1: () {
              Navigator.pop(context);
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Профиль'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              ProfileTitle(
                hasSubscription: widget.hasSubscribtion,
              ),
              const SizedBox(height: 24),
              !widget.hasSubscribtion
                  ? !isMakeSubs
                      ? MakeSubsButton(
                          onMakeSubs: onMakeSubs,
                        )
                      : const SizedBox()
                  : const SizedBox(),
              const SizedBox(height: 16),
              ProfileButtons(
                hasSubscription: widget.hasSubscribtion,
              ),
            ],
          ),
          Positioned(
            bottom: 14,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width - 32,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: onSingOut,
                    child: const Text('Выйти из профиля'),
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
