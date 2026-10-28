import 'package:flutter/material.dart';

import '../../shared/constant.dart';

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    super.key,
    this.isSelected = false,
    this.title = '',
    required this.icon,
    required this.onTap,
  });

  final bool isSelected;
  final IconData icon;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    if (!isSelected) {
      return GestureDetector(
          onTap: onTap,
          child: Icon(icon, color: Colors.black38));
    }
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(1000)),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
