import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required TabController tabController,
    required List<Tab> tabs,
  })  : _tabController = tabController,
        _tabs = tabs;

  final TabController _tabController;
  final List<Tab> _tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 36,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(118, 118, 118, 0.12),
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: TabBar(
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.all(2),
        indicator: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Colors.black.withOpacity(0.12),
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 3),
              color: Color.fromRGBO(0, 0, 0, 0.04),
              blurRadius: 1,
            ),
            BoxShadow(
              offset: Offset(0, 3),
              color: Color.fromRGBO(0, 0, 0, 0.12),
              blurRadius: 8,
            ),
          ],
          borderRadius: BorderRadius.circular(7.0),
          color: Colors.white,
        ),
        tabs: _tabs,
      ),
    );
  }
}
