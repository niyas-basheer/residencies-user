import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/features/authentication/screens/signup/widgets/t_signupform.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';
import '../../../../common/widgets/t_form_divider.dart';
import '../../../../common/widgets/t_social_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// form
              const TSignupform(),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// divider
              TFormDivider(
                dividerText: TTexts.orSignUpWith.capitalize!,
              ),

              
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
