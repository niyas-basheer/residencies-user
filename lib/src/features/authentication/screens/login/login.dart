import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/common/styles/spacing_styles.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';
import 'package:residential_manager/src/utils/helpers/helper_function.dart';

import '../../../../common/widgets/t_form_divider.dart';
import '../../../../common/widgets/t_social_buttons.dart';
import 'widgets/tlogin_form.dart';
import 'widgets/tloginheader.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [

              /// logo , title & sub-title
              Tloginheader(dark: dark),

              /// form
              const TloginForm(),

              /// divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!,),
              
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
