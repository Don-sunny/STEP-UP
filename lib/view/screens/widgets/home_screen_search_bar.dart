import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:step_up/util/widgets/subtitle_widget.dart';

class HomeScreenSearchBar extends StatelessWidget {
  const HomeScreenSearchBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.08,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(40),
      ),
      child: const Center(
          child: Row(
        children: [
          Icon(
            Ionicons.search,
            size: 35,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          SubTitleWidget(
            fontSize: 20,
            text: 'Search here',
            color: Colors.grey,
          )
        ],
      )),
    );
  }
}
