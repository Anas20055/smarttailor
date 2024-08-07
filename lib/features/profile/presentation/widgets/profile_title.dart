// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_tailor/core/common_widgets/adaptive_bottom_sheet.dart';

import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/core/constants/app_svg.dart';

class ProfileTitle extends StatefulWidget {
  final bool hasSubscription;
  const ProfileTitle({
    super.key,
    required this.hasSubscription,
  });

  @override
  ProfileTitleState createState() => ProfileTitleState();
}

class ProfileTitleState extends State<ProfileTitle> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {}
    });
  }

  void onNotificationPressed() {
    Navigator.pushNamed(context, AppRouteNames.notificationsPage);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              AdaptiveBottomSheet.showImageSourceActionSheet(
                context: context,
                button1: 'Сделать фотографию',
                button2: 'Выбрать фотографию',
                onPressed1: () {
                  _getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                onPressed2: () {
                  _getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              );
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: _image != null
                  ? Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    )
                  : SvgPicture.asset(AppSvg.imageEmpty),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Кирилл Олейников',
                  style: theme.labelMedium,
                ),
                Text(widget.hasSubscription
                    ? 'Подписка оформлена!'
                    : 'Изменить фото профиля'),
                widget.hasSubscription
                    ? const Text('Срок: до 1 августа 2024')
                    : const SizedBox(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onNotificationPressed,
              icon: SvgPicture.asset(AppSvg.notification),
            ),
          ),
        ],
      ),
    );
  }
}
