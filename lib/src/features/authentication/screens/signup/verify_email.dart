import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/data/repositories/authentication_repository.dart';
import 'package:residential_manager/src/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';
import 'package:residential_manager/src/utils/helpers/helper_function.dart';


class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
      children: [
        //image
        Image(
          image: const AssetImage(TImages.emailVerficationImage),
          width: THelperFunction.screenWidth() * 0.6,
        ),
        const SizedBox(
          height: TSizes.spaceBtwnInputFields,
        ),
    
        //title & subtitle
        Text(
          TTexts.confirmEmail,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.spaceBtwnInputFields,
        ),
        Text(
          email??'',
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.spaceBtwnInputFields,
        ),
        Text(
          TTexts.confirmEmailSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.spaceBtwnInputFields,
        ),
        //buttons
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => controller.checkEmailVerificationStatus(),
              child: const Text(TTexts.tContinue)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwnInputFields,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
              onPressed: ()=> controller.sendEmailVerification(), child: const Text(TTexts.resendEmail)),
        ),
      ],
    ),
        ),
      ),
    );
  }
}
