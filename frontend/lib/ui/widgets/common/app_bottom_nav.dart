import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTabSelected;

  const AppBottomNav({
    super.key,
    this.currentIndex = 0,
    this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home_rounded,
                label: 'Marketplace',
                index: 0,
              ),
              _buildNavItem(
                icon: Icons.search_rounded,
                label: 'Search',
                index: 1,
              ),
              _buildCenterButton(),
              _buildNavItem(
                icon: Icons.groups_rounded,
                label: 'Community',
                index: 3,
              ),
              _buildNavItem(
                icon: Icons.person_outline_rounded,
                label: 'Profile',
                index: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex == index;
    final color = isSelected ? const Color(0xFF00B4D8) : Colors.grey.shade600;

    return InkWell(
      onTap: () {
        if (!isSelected) {
          onTabSelected?.call(index);
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 26,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterButton() {
    final isSelected = currentIndex == 2;
    final activeColor = const Color(0xFF00B4D8);
    final inactiveLabelColor = Colors.grey.shade600;
    final inactiveBgColor = Color(0xFF80E2F1);
    
    return InkWell(
      onTap: () {
        if (!isSelected) {
          onTabSelected?.call(2);
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? activeColor : inactiveBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.add,
                color: isSelected ? Colors.white : activeColor,
                size: 22,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Sell Now',
              style: TextStyle(
                color: isSelected ? activeColor : inactiveLabelColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
