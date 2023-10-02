import 'package:flutter/material.dart';
import 'package:step_up/services/asset_manager.dart';

class BrandsWidget extends StatelessWidget {
  BrandsWidget({
    super.key,
    required this.image,
    required this.name,
    required this.color,
  });
  final String image, name;
  Color color;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Center(
            child: Image.asset(
              image,
              height: 60,
            ),
          ),
        )
      ],
    );
  }
}
