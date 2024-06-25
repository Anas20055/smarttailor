// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tailor/core/constants/app_svg.dart';

class ProfileButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const ProfileButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          foregroundColor: MaterialStatePropertyAll(Colors.black),
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: SvgPicture.asset(AppSvg.arrowForward),
          ),
        ],
      ),
    );
  }
}
