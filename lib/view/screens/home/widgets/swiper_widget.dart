import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:step_up/util/constants/app_constants.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Swiper(
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
    );
  }
}
