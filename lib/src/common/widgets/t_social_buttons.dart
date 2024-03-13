import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/features/authentication/controllers/login/login_conttrollers.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';
import 'package:residential_manager/src/utils/constants/size.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Tcolors.grey),
              borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                onPressed: ()=>controller.googleSignIn() ,
                icon: const Image(image:AssetImage(TImages.google) ,
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                ),
              ),
        ),
    
        const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
    
          Container(
          decoration: BoxDecoration(
              border: Border.all(color: Tcolors.grey),
              borderRadius: BorderRadius.circular(100)),
              child: IconButton(onPressed: (){},
                icon: const Image(image:AssetImage(TImages.facebook) ,
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                ),
              ),
        ),
      ],
    );
  }
}
