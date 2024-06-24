import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/features/bottom_bar/domain/entity/title_enum.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onItemTapped;
  const CustomBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 20,
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      height: 116,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            NavBarTitle.values.length,
            (index) {
              final item = NavBarTitle.values[index];
              return _buildNavItem(
                svg: item.svg,
                index: item.index,
                title: item.title,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String svg,
    required int index,
    required String title,
  }) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        children: [
          const SizedBox(height: 26),
          SvgPicture.asset(
            svg,
            colorFilter: ColorFilter.mode(
              selectedIndex == index ? AppColors.darkBlue : AppColors.darkGrey,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: selectedIndex == index
                  ? AppColors.darkBlue
                  : AppColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
