import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_up/controller/providers/theme_provider.dart';
import 'package:step_up/services/asset_manager.dart';
import 'package:step_up/util/constants/app_constants.dart';
import 'package:step_up/util/widgets/subtitle_widget.dart';
import 'package:step_up/view/screens/home/widgets/grid_view_count_widget.dart';
import 'package:step_up/view/screens/home/widgets/swiper_widget.dart';
import 'package:step_up/view/screens/inner_screen/app_drawer.dart';
import 'package:step_up/view/screens/search_screen.dart';
import 'package:step_up/view/screens/widgets/brands_widget.dart';
import 'package:step_up/view/screens/widgets/home_screen_search_bar.dart';
import 'package:step_up/view/screens/widgets/latest_arrivals.dart';

class HomeScreen extends StatelessWidget {
  static const rootName = '/HomeScreen';
  HomeScreen({super.key});

  TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      drawer: MyAppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                child: HomeScreenSearchBar(size: size),
                onTap: () {
                  Navigator.pushNamed(context, SearchScreen.rootName);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: size.height * 0.25,
                child: const SwiperWidget(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubTitleWidget(fontSize: 20, text: 'New Arrival'),
                  SubTitleWidget(
                    fontSize: 20,
                    text: 'See All',
                    color: Colors.green,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: size.height * 0.20,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const LatestArrival(
                      image: AssetManageer.image1,
                      shoeName: 'Nike shoes',
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: SubTitleWidget(
                  fontSize: 30,
                  text: 'Brands',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: size.height * 0.20,
                child: const GridViewCount(),
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
