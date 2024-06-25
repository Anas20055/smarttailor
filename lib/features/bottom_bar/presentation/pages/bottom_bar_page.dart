import 'package:flutter/material.dart';
import 'package:smart_tailor/features/bottom_bar/presentation/widgets/custom_bottom_bar.dart';
import 'package:smart_tailor/features/marketplace/presentation/pages/marketplace_page.dart';
import 'package:smart_tailor/features/order/presentation/pages/order_page.dart';
import 'package:smart_tailor/features/organization/presentation/organization_page.dart';
import 'package:smart_tailor/features/profile/presentation/pages/profile_page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({
    super.key,
  });

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _selectedIndex = 3;

  static const List<Widget> _widgetOptions = [
    MarketPlacePage(),
    OrderPage(),
    OrganizationPage(),
    ProfilePage(
      hasSubscribtion: false,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
