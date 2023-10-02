import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:step_up/util/widgets/subtitle_widget.dart';
import 'package:step_up/view/screens/widgets/products/product_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  static const rootName = '/SearchScreen';

  TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
          ),
          title: const SubTitleWidget(
            fontSize: 25,
            text: 'Search Products',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: searchEditingController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.clear,
                    ),
                  ),
                ),
                onSubmitted: (value) {},
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: DynamicHeightGridView(
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    builder: (context, index) {
                      return const ProductWidget();
                    },
                    itemCount: 100,
                    crossAxisCount: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
