import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:step_up/view/screens/cart_screen.dart';
import 'package:step_up/view/screens/home_screen.dart';
import 'package:step_up/view/screens/profile_screen.dart';
import 'package:step_up/view/screens/search_screen.dart';
import 'package:step_up/view/screens/wishlist_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final _pageController = PageController(initialPage: 0);

  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> bottomBarPages = [
    HomeScreen(),
    const CartScreen(),
    const WishlistScreen(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            bottomBarPages.length,
            (index) => bottomBarPages[index],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(
                notchBottomBarController: _controller,
                color: Colors.black,
                showLabel: false,
                notchColor: Colors.green[200]!,
                durationInMilliSeconds: 150,
                bottomBarItems: [
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.home,
                      color: Colors.grey[300],
                    ),
                    activeItem: const Icon(
                      Icons.home,
                      color: Colors.green,
                    ),
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.shopping_bag,
                      color: Colors.grey[300],
                    ),
                    activeItem: const Icon(
                      Icons.shopping_bag,
                      color: Colors.green,
                    ),
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.favorite,
                      color: Colors.grey[300],
                    ),
                    activeItem: const Icon(
                      Icons.favorite,
                      color: Colors.green,
                    ),
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.person_2_rounded,
                      color: Colors.grey[300],
                    ),
                    activeItem: const Icon(
                      Icons.person_2_rounded,
                      color: Colors.green,
                    ),
                  )
                ],
                onTap: (index) {
                  _pageController.jumpToPage(index);
                })
            : null);
  }
}
