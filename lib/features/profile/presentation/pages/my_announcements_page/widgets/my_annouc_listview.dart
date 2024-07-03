import 'package:flutter/material.dart';
import 'package:smart_tailor/features/profile/presentation/pages/my_announcements_page/widgets/my_announc_itme.dart';

class MyAnnouncListView extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  final VoidCallback onTap;
  const MyAnnouncListView({
    super.key,
    required this.image,
    required this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: 20,
      itemBuilder: (context, index) {
        return NyAnnouncItem(
          onTap: onTap,
          color: color,
          image: image,
          title: title,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
