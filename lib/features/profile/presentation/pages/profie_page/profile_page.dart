import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
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
        return CupertinoAlertDialog(
          title: const Text('Вы действительно хотите выйти?'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Закрыть',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRouteNames.welcome,
                );
              },
              child: const Text(
                'Да',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
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
        return CupertinoAlertDialog(
          title: const Text('Ура! 🎉'),
          content: const Text('Подписка уже в пути!'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Понятно',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
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
