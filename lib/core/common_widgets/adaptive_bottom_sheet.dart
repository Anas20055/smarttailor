import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AdaptiveBottomSheet {
  static void showImageSourceActionSheet({
    required BuildContext context,
    required String button1,
    required String button2,
    required void Function() onPressed1,
    required void Function() onPressed2,
  }) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: onPressed1,
              child: Text(
                button1,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: onPressed2,
              child: Text(
                button2,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text(
              'Закрыть',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: Text(button1),
                  onTap: onPressed1,
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: Text(button2),
                  onTap: onPressed2,
                ),
                ListTile(
                  leading: const Icon(Icons.close),
                  title: const Text('Закрыть'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
