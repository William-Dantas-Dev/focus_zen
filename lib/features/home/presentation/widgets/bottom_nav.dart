import 'package:flutter/material.dart';

import 'bottom_nav_item.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavItem(
            icon: Icons.timer_rounded,
            isActive: currentIndex == 0,
            onTap: () => onItemSelected(0),
          ),
          BottomNavItem(
            icon: Icons.bar_chart_rounded,
            isActive: currentIndex == 1,
            onTap: () => onItemSelected(1),
          ),
          BottomNavItem(
            icon: Icons.settings_rounded,
            isActive: currentIndex == 2,
            onTap: () => onItemSelected(2),
          ),
        ],
      ),
    );
  }
}
