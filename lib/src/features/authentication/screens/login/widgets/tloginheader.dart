import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';

class Tloginheader extends StatelessWidget {
  const Tloginheader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(
              dark ? TImages.darkAppLogo :TImages.lightAppLogo ),
          height: 150,
        ),
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Text(
          TTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
