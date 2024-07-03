import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';

class InfoTitle extends StatelessWidget {
  final String? title;
  const InfoTitle({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: CachedNetworkImageProvider(
                'https://s3-alpha-sig.figma.com/img/0a82/65e7/2271e6abf329ded94db16088230aa6b5?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ik1OROxsZTVA6Q7mURM0Q3kf3bJ8-B7lHsdRmN1sgCCPM9RfACEAOuRGjz4Jz4oQaDemosxb-iw4EjFXJf2Nm3Az5p3YGyclbTrCNvlDNtnOehpV9jSRnv-Dobn9YUJjQf0tDS2DyoQbXqJkzCH6bZ~9HW1kIJ48cIbDC-7Xs7aIew4CeCX~xrh0NYjcmDhQHtlxWj9otP5r6PIJW0goWgDming~foaUgQJPnY5FDyShBrDv5ji3-KK8RP2GSRmf~ZBFFKKdjLv27fWwuNNQhIu6iDvbn5Ac-ulkBi6ZjKOLpBfRKRZqrb2xxT7TY4yFWNHnsdKN5FLwXjPxuMtUig__'),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Олег Васильев',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Text(
                '+996 700 010 101',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                title ?? 'Оборудование',
                style: TextStyle(
                  fontSize: 12,
                  color: title == null ? AppColors.green : AppColors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
