import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/constants/app_svg.dart';

class NotifcationsPage extends StatefulWidget {
  const NotifcationsPage({super.key});

  @override
  State<NotifcationsPage> createState() => _NotifcationsPageState();
}

class _NotifcationsPageState extends State<NotifcationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Уведомления'),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.fromLTRB(16, 35, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 24);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: AppColors.yellow,
                        radius: 4,
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(AppSvg.userIcon),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Объявление №23',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Сегодня, в 11:34',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(32, 34, 35, 0.6),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'User 21 откликнулся на ваше объявление',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(32, 34, 35, 0.6),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            const Divider(
              height: 1,
              color: AppColors.darkGrey,
            ),
            InkWell(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
              onTap: () {},
              child: Ink(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                padding: const EdgeInsets.all(28),
                child: Row(
                  children: [
                    SvgPicture.asset(AppSvg.eye),
                    const SizedBox(width: 8),
                    const Text('Отметить все прочитанными'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
