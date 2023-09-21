import 'package:flutter/material.dart';

class DiverderWidget extends StatelessWidget {
  const DiverderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        thickness: 1.5,
        color: Colors.grey.shade400,
        height: 10,
      ),
    );
  }
}
