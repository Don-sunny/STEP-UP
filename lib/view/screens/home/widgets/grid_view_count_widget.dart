import 'package:flutter/material.dart';
import 'package:step_up/services/asset_manager.dart';
import 'package:step_up/view/screens/widgets/brands_widget.dart';

class GridViewCount extends StatelessWidget {
  const GridViewCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      children: [
        BrandsWidget(
          image: AssetManageer.adidas,
          name: 'Addidas',
          color: Colors.red[200]!,
        ),
        BrandsWidget(
          image: AssetManageer.nike,
          name: 'New Balance',
          color: Colors.blue[200]!,
        ),
        BrandsWidget(
          image: AssetManageer.puma,
          name: 'Addidas',
          color: Colors.green[200]!,
        ),
        BrandsWidget(
          image: AssetManageer.newBalance,
          name: 'Addidas',
          color: Colors.yellow[200]!,
        ),
        BrandsWidget(
          image: AssetManageer.lotto,
          name: 'Addidas',
          color: Colors.orange[200]!,
        ),
        BrandsWidget(
          image: AssetManageer.skechers,
          name: 'Addidas',
          color: Colors.purple[200]!,
        ),
        BrandsWidget(
          image: AssetManageer.underArmour,
          name: 'Addidas',
          color: Colors.brown[200]!,
        ),
        BrandsWidget(
          image: AssetManageer.willson,
          name: 'Addidas',
          color: Colors.pink[200]!,
        ),
      ],
    );
  }
}
