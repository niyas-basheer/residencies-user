import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:residential_manager/src/features/authentication/controllers.onboarbing/onboarding.controller.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/device/device_utility.dart';
import 'package:residential_manager/src/utils/helpers/helper_function.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
       final dark=THelperFuction.isDarkMode(context);
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () =>OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(shape:const CircleBorder(), backgroundColor:dark ? Tcolors.primary: Colors.black ),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
