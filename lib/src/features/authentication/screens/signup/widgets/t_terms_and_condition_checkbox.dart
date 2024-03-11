import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/features/authentication/controllers/signup/signup_controller.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';
import 'package:residential_manager/src/utils/helpers/helper_function.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final contrller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() => Checkbox(
              value: contrller.privecypolicy.value,
              onChanged: (Value) => contrller.privecypolicy.value =
                  !contrller.privecypolicy.value)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${TTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? Tcolors.white : Tcolors.primary,
                  decoration: TextDecoration.underline)),
          TextSpan(
              text: '${TTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: TTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? Tcolors.white : Tcolors.primary,
                  decoration: TextDecoration.underline)),
        ]))
      ],
    );
  }
}
