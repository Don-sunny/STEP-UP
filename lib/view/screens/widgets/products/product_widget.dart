import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:step_up/services/asset_manager.dart';
import 'package:step_up/util/widgets/subtitle_widget.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              AssetManageer.image2,
              height: size.height * 0.17,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                flex: 5,
                child: SubTitleWidget(
                  fontSize: 16,
                  text: 'Title' * 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(IconlyLight.heart),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 5,
                child: SubTitleWidget(
                  fontSize: 16,
                  text: '\$155.00',
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Flexible(
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.lightGreenAccent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(12),
                    splashColor: Colors.green,
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.shopping_cart_checkout_outlined,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
