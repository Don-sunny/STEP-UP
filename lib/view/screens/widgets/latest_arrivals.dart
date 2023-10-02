import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:step_up/services/asset_manager.dart';
import 'package:step_up/util/widgets/subtitle_widget.dart';

class LatestArrival extends StatelessWidget {
  const LatestArrival({
    super.key,
    required this.image,
    required this.shoeName,
  });

  final String image;
  final String shoeName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.35,
      child: Card(
        margin: const EdgeInsets.only(right: 20),
        elevation: 5,
        shape: Border.all(color: Colors.grey),
        child: Column(
          children: [
            Image.asset(
              AssetManageer.image3,
              height: size.width * 0.25,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubTitleWidget(
                        fontSize: 16,
                        text: 'Nike shoes',
                      ),
                      Icon(IconlyLight.heart)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SubTitleWidget(
                    fontSize: 18,
                    text: '\$ 100',
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
