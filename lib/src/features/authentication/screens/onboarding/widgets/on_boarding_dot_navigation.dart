import 'package:flutter/material.dart';
import 'package:residential_manager/src/features/authentication/controllers/onboarding/onboarding.controller.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/device/device_utility.dart';
import 'package:residential_manager/src/utils/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  final controller = OnBoardingController.instance;
   final dark=THelperFunction.isDarkMode(context);

    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked:controller.dotNavigationClick ,
          count: 3,
          effect:  ExpandingDotsEffect(
              activeDotColor:dark ? Tcolors.light: Tcolors.dark, dotHeight: 6),
        ));
  }
}
