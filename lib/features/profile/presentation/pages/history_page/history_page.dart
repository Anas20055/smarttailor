import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tailor/core/common_widgets/custom_tab_bar.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/constants/app_svg.dart';

enum StatusType {
  arrived('Прибыл', AppColors.green),
  pending('В ожидании', AppColors.blue),
  sending('Отправка', AppColors.orange),
  check('Проверка', AppColors.yellow);

  final String title;
  final Color color;
  const StatusType(
    this.title,
    this.color,
  );
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> _tabs = const [
    Tab(text: "Активные"),
    Tab(text: "Завершенные"),
  ];

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
        title: const Text('История заказов'),
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
              children: const [
                HistoryListView(isActive: true),
                HistoryListView(isActive: false),
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

class HistoryListView extends StatelessWidget {
  final bool isActive;
  const HistoryListView({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (BuildContext context, int index) {
        return HistoryItem(
          isActive: isActive,
          index: index,
        );
      },
    );
  }
}

class HistoryItem extends StatelessWidget {
  final bool isActive;
  final int index;
  const HistoryItem({
    super.key,
    required this.isActive,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w400,
        );
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Заказы:',
                style: textTheme,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Сумма:',
                style: textTheme,
              ),
              if (isActive) ...[
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Статус:',
                  style: textTheme,
                ),
              ],
              const SizedBox(height: 8),
              Text(
                isActive ? 'Дата принятия:' : 'Дата завершения:',
                style: textTheme,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '№234',
                style: textTheme,
              ),
              const SizedBox(height: 8, width: 98),
              Text(
                '1000 сом',
                style: textTheme,
              ),
              if (isActive) ...[
                const SizedBox(
                  height: 8,
                ),
                Text(
                  StatusType.values[index % StatusType.values.length].title,
                  style: textTheme?.copyWith(
                    color: StatusType
                        .values[index % StatusType.values.length].color,
                  ),
                ),
              ],
              const SizedBox(height: 8),
              Text(
                '10.04.2024',
                style: textTheme,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
