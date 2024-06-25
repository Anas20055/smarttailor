import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tailor/core/constants/app_svg.dart';
import 'package:smart_tailor/features/auth/domain/entity/register_enum.dart';
import 'package:smart_tailor/features/auth/presentation/pages/register_page/widgets/register_form_fields.dart';
import 'package:smart_tailor/features/profile/presentation/widgets/profile_title.dart';

extension StatusExtension on FieldType {
  String? fields() {
    return switch (this) {
      FieldType.username => 'Soodokeev',
      FieldType.name => 'anas',
      FieldType.midname => 'fsfsf',
      FieldType.email => 'anas@gmail.com',
      FieldType.phone => '+996 554 030 605'
    };
  }
}

class PersonalInfoPage extends StatefulWidget {
  final bool hasSubscribtion;
  const PersonalInfoPage({
    super.key,
    required this.hasSubscribtion,
  });

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<FieldType, TextEditingController> _controllers = {
    for (var type in FieldType.values)
      type: TextEditingController(
        text: type.fields(),
      ),
  };
  final Map<FieldType, ValueNotifier<bool>> _isFieldEmpty = {
    for (var type in FieldType.values) type: ValueNotifier<bool>(true)
  };
  void onSaveData() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Сохранено!'),
          content: const Text('Ваши данные сохранены!'),
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
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' '),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              ProfileTitle(
                hasSubscription: widget.hasSubscribtion,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Личные данные',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SvgPicture.asset(AppSvg.pen),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RegisterFormFields(
                  fontColor: Colors.black.withOpacity(0.6),
                  fontSize: 14,
                  borderColor: Colors.white,
                  formKey: _formKey,
                  isFieldEmpty: _isFieldEmpty,
                  controllers: _controllers,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width - 32,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: onSaveData,
                    child: const Text('Сохранить данные'),
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
