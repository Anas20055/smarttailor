import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveAlertDiolog extends StatelessWidget {
  final String title;
  final String? content;
  final String button1;
  final String? button2;
  final VoidCallback onPressed1;
  final VoidCallback? onPressed2;
  const AdaptiveAlertDiolog({
    super.key,
    required this.title,
    this.content,
    required this.button1,
    this.button2,
    required this.onPressed1,
    this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content ?? ''),
        actions: [
          CupertinoDialogAction(
            onPressed: onPressed1,
            child: Text(
              button1,
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          if (button2 != null)
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: onPressed2,
              child: Text(
                button2 ?? '',
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
        ],
      );
    }
    return AlertDialog(
      title: Text(title),
      content: Text(content ?? ''),
      actions: [
        TextButton(
          onPressed: onPressed1,
          child: Text(button1),
        ),
        if (button2 != null)
          TextButton(
            onPressed: onPressed2,
            child: Text(button2 ?? ''),
          ),
      ],
    );
  }
}
