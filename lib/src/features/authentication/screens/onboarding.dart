import 'package:flutter/material.dart';
import 'package:residential_manager/src/utils/helpers/helper_function.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Stack(
        children: [
          PageView(
            children: [
              Column(
                children: [
                  
                  Image(
                    width: THelperFuction.screenWidth()*0.8,
                    height: THelperFuction.screenHight()*0.6,
                    image: const AssetImage(TImges.onBoardingImage1) )
                ],
              )
            ],
          )
        ],
      )
    );

  }
}