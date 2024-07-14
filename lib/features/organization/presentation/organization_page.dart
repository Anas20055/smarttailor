import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tailor/core/common_widgets/custom_tab_bar.dart';
import 'package:smart_tailor/core/constants/app_images.dart';
import 'package:smart_tailor/core/constants/app_routes_names.dart';
import 'package:smart_tailor/features/organization/cubit/organization_cubit.dart';

class OrganizationPage extends StatefulWidget {
  const OrganizationPage({super.key});

  @override
  State<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizationCubit, OrganizationState>(
      builder: (context, state) {
        if (state.organizationExist == true) {
          return const OrganizationExistScreen();
        }
        return const OrganizationDoesntExistScreen();
      },
    );
  }
}

class OrganizationExistScreen extends StatefulWidget {
  const OrganizationExistScreen({super.key});

  @override
  State<OrganizationExistScreen> createState() =>
      _OrganizationExistScreenState();
}

class _OrganizationExistScreenState extends State<OrganizationExistScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> _tabs = const [
    Tab(text: "Сотрудники"),
    Tab(text: "Должности"),
    Tab(text: "Текущие заказы"),
    Tab(text: "История"),
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              title: const Text('Организация'),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const OrganizationTitle(),
                    const SizedBox(height: 4),
                    CustomTabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabController: _tabController,
                      tabs: _tabs,
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: TabBar(
                    controller: _tabController,
                    tabs: _tabs,
                    isScrollable: true,
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            EmployeesTap(),
            Text('Должности content'),
            Text('Текущие заказы content'),
            Text('История content'),
          ],
        ),
      ),
    );
  }
}

class PositionsTab extends StatefulWidget {
  const PositionsTab({super.key});

  @override
  State<PositionsTab> createState() => _PositionsTabState();
}

class _PositionsTabState extends State<PositionsTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class EmployeesTap extends StatelessWidget {
  const EmployeesTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemCount: 10,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 12);
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(6),
              child: Ink(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Олейников Кирилл Кириллович',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Утюжник'),
                    const SizedBox(height: 8),
                    Text(
                      'oleinikov@gmail.com',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 16,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width - 32,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Пригласить сотрудника'),
            ),
          ),
        ),
      ],
    );
  }
}

class OrganizationTitle extends StatelessWidget {
  const OrganizationTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(AppImages.imageBigTitle),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SmartTale',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Мониторинг и управление \nшвейным производством',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Создан 10 апреля 2024',
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OrganizationDoesntExistScreen extends StatelessWidget {
  const OrganizationDoesntExistScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Организация'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Тут еще нет организаций 🙂',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Создайте свою организацию \nи добавьте своих сотрудников',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width - 32,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, AppRouteNames.createOrganizationPage);
                },
                child: const Text('Создать'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
