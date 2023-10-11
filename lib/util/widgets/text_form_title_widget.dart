import 'package:flutter/material.dart';

class TextFormTitleWidget extends StatelessWidget {
  const TextFormTitleWidget({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    );
  }
}
