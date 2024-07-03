// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:smart_tailor/core/common_widgets/custom_tab_bar.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/core/constants/app_svg.dart';
import 'package:smart_tailor/features/profile/presentation/pages/my_announcements_page/widgets/my_annouc_listview.dart';

class MyAnnouncementPage extends StatefulWidget {
  const MyAnnouncementPage({super.key});

  @override
  State<MyAnnouncementPage> createState() => _MyAnnouncementPageState();
}

class _MyAnnouncementPageState extends State<MyAnnouncementPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> _tabs = const [
    Tab(text: "Заказы"),
    Tab(text: "Оборудование"),
  ];
  void onOrderTap() {
    Navigator.pushNamed(context, AppRouteNames.detailMyAnnounc,
        arguments: 'Заказ');
  }

  void onEquipmentTap() {
    Navigator.pushNamed(context, AppRouteNames.detailMyAnnounc);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои объявления'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          CustomTabBar(
            tabController: _tabController,
            tabs: _tabs,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MyAnnouncListView(
                  onTap: onOrderTap,
                  title: 'Заказ',
                  image:
                      "https://s3-alpha-sig.figma.com/img/7ca6/1381/bc490dc8d48d7cb641f4df307ab1b952?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=TrxNf5x1ef2tM3qbv6BuxqPSutSn9HLG6ZBpoSHSw1UaoK7MsRAVScWEcz6UV~Wbq94klUzN2BxYjm3-m5cBDbZzPqZ5tcevgE1KeLnGt9BSn6AMwq4Mup3mu8LPAgAKb9l52lBO2vCDEBuCoSwToamrLD8Jc59p-jWCDkidsUjmnXfWeDh5c6FNfLQEofT1NLfRQKx7ElpBqU7A1RSUxeisbnSzshopRE4q2XX0l9zmrG0zeq1RRtB3suyPTDn4P0fHhSmCsUVOgqWCQtGXg-~OTMVlWTlZH1zcV6BGcafbZKcSMCl8HE9RKH7pcn8O188XpZEP-h9Jfqzkm8tupQ__",
                  color: AppColors.blue,
                ),
                MyAnnouncListView(
                  onTap: onEquipmentTap,
                  title: 'Оборудование',
                  image:
                      "https://s3-alpha-sig.figma.com/img/3de8/e17f/87cf056f022b1efb54d852603b31b8c8?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=eUG9J0Z0a7pw57xckVVgtGShviVyigIEQCaOuVzVj~JgESDw7dACopIlzMm5IjFxf7OAMLdKdxHJwd0-Pcn2yJVrw5hpCLZpk7E1wR~GK-GYhn-P2bTVv4SQJvPYaypmDXgNqNf-4LBJjkdux-JHq~8L2-Qw8A8nVFTSyfSPYyI9vtEJD3tN93elppCiqiBIFGB8sSRLI9DL0Zw2xTSP59G3FQQfEAbnbedclLZ7opLHFORhPJEXukkWr9sWjNF5blYw3z0qTboUhMWuFnxRdvJxkdL8lk3jSsYezjxrfg7DA1Al~Dz15JNAWnJz5Ej04WGi6YYpLBkqmECH6hUSWQ__",
                  color: AppColors.green,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.yellow,
        onPressed: () {},
        shape: const CircleBorder(),
        child: SvgPicture.asset(AppSvg.search),
      ),
    );
  }
}
