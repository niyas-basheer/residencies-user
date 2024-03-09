import 'package:flutter/material.dart';
import 'package:residential_manager/src/features/authentication/controllers.onboarbing/onboarding.controller.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () =>OnBoardingController.instance.skipPage(),
          child: const Text("Skip"),
        ));
  }
}
