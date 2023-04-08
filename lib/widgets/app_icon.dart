import 'package:flutter/material.dart';

import '../utils/dimensions/dimensions.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
      {super.key,
      required this.icon,
      this.backgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.size = 40,
      this.iconSize = 16});
  final IconData icon;
  final Color backgroundColor, iconColor;
  final double size, iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor),
      child: Icon(icon, size: iconSize, color: iconColor),
    );
  }
}
