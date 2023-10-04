import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_up/controller/providers/theme_provider.dart';
import 'package:step_up/services/asset_manager.dart';
import 'package:step_up/util/constants/app_constants.dart';
import 'package:step_up/util/widgets/icon_widget.dart';
import 'package:step_up/util/widgets/subtitle_widget.dart';
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const IconWidget(
            icon: Icons.menu,
            size: 35,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                themeProvider.getIsDarkTheme
                    ? themeProvider.setDarkTheme(false)
                    : themeProvider.setDarkTheme(true);
              },
              icon: IconWidget(
                icon: themeProvider.getIsDarkTheme
                    ? Icons.dark_mode
                    : Icons.light_mode,
                size: 35,
              ))
        ],
      ),
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
                child: Swiper(
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        AppConstants.bannerImage[index],
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  itemCount: AppConstants.bannerImage.length,
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.green,
                      color: Colors.white,
                    ),
                  ),
                  // viewportFraction: 0.8,
                  // scale: 0.9,
                  // control: SwiperControl(),
                ),
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
                child: GridView.count(
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
                ),
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
