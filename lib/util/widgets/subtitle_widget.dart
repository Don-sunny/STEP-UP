import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({
    super.key,
    this.color = Colors.white,
    required this.fontSize,
    required this.text,
  });

  final Color color;
  final double fontSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
