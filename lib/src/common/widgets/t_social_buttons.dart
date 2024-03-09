import 'package:flutter/cupertino.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';
import 'package:residential_manager/src/utils/constants/size.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Tcolors.grey),
              borderRadius: BorderRadius.circular(100)),
              child: const Image(image:AssetImage(TImages.google) ,
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              ),
        ),
    
        const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
    
          Container(
          decoration: BoxDecoration(
              border: Border.all(color: Tcolors.grey),
              borderRadius: BorderRadius.circular(100)),
              child: const Image(image:AssetImage(TImages.facebook) ,
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              ),
        ),
      ],
    );
  }
}
