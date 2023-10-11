import 'package:flutter/material.dart';

class CircleWiget extends StatelessWidget {
  const CircleWiget({
    super.key,
    this.color = Colors.white,
    this.icon,
    this.iconColor = Colors.white,
    this.iconSize,
    this.width = 50,
    this.height = 70,
  });
  final Color color;
  final IconData? icon;
  final double? iconSize;
  final Color iconColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
