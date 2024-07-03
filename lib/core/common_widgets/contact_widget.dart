import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/constants/app_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 6, 24),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 31,
            backgroundImage: CachedNetworkImageProvider(
                'https://s3-alpha-sig.figma.com/img/ffc1/4cd3/1111aefb2980dcf0a98c1acf18ebd9d2?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=d7TRqiwU1DhZZLBwXn1PKOtRUQceUcMqY7zwJ1jTdLw372ZuSfnxdFzwbLftwSkEXxMNVb~xhwu8-glM21Tm7xtS2lg-h30qfQ1F-YZ4GXOaNNk13vFE17o2OhigAEqztj2IIbPOS8SQHNIKTgYfGg7QnyarnTD-x7TFUXfUWnxlsz5T6YWuk303DQMcOM1yET~jjEL2I3bIBqHFp7CMjhzZur2KTANLrWZA--IBCiiJRr-LXFCSgI7UzI0jtmNGKaYZWUuF-mM0rjCriMeybesirgCXRkB5-GMaEs49VSPj06dff-1u9OzXD5r2Fqrq9DG1SQ1HplYB5kD9OXVpKw__'),
          ),
          const SizedBox(width: 4),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sandy Wilder Cheng',
                ),
                SizedBox(height: 4),
                Text(
                  'Автор объявления',
                  style: TextStyle(
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(AppSvg.call),
            onPressed: () {
              launchUrlString("tel:214324234");
            },
          ),
        ],
      ),
    );
  }
}
