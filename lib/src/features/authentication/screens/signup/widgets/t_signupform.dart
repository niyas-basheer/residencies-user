import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:residential_manager/src/features/authentication/controllers/signup/signup_controller.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';
import 'package:residential_manager/src/utils/validators/validation.dart';

import 't_terms_and_condition_checkbox.dart';

class TSignupform extends StatelessWidget {
  const TSignupform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contrller = Get.put(SignupController());
    return Form(
      key: contrller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText("First name", value),
                  controller: contrller.firstName,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName, prefix: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwnInputFields,
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText("Last name", value),
                  controller: contrller.lastName,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastName, prefix: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwnInputFields,
          ),

          //username
          TextFormField(
            validator: (value) =>
                TValidator.validateEmptyText("username", value),
            controller: contrller.username,
            decoration: const InputDecoration(
                labelText: TTexts.username, prefix: Icon(Iconsax.user_edit)),
          ),

          const SizedBox(
            height: TSizes.spaceBtwnInputFields,
          ),

          //email
          TextFormField(
            validator: TValidator.validateEmail,
            controller: contrller.email,
            decoration: const InputDecoration(
                labelText: TTexts.email, prefix: Icon(Iconsax.direct)),
          ),

          const SizedBox(
            height: TSizes.spaceBtwnInputFields,
          ),

          //phoneNo.
          TextFormField(
            validator: TValidator.validatePhoneNumber,
            controller: contrller.phoneNumber,
            decoration: const InputDecoration(
                labelText: TTexts.phoneNumber, prefix: Icon(Iconsax.call)),
          ),

          const SizedBox(
            height: TSizes.spaceBtwnInputFields,
          ),

          //password
          Obx(
            () => TextFormField(
              validator: TValidator.validatePassword,
              controller: contrller.password,
              obscureText: contrller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefix: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => contrller.hidePassword.value =
                          !contrller.hidePassword.value,
                      icon:  Icon(contrller.hidePassword.value? Iconsax.eye_slash:Iconsax.eye))),
            ),
          ),
          
          const SizedBox(
            height: TSizes.spaceBtwnInputFields,
          ),

          //conform Password
          Obx(
            () => TextFormField(
              validator: (value) => TValidator.validateConfirmPassword(contrller.password.text,value),
              controller: contrller.confirmPassword,
              obscureText: contrller.hideConfirmPassword.value,
              decoration: InputDecoration(
                  labelText: TTexts.confirmPassword,
                  prefix: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => contrller.hideConfirmPassword.value =
                          !contrller.hideConfirmPassword.value,
                      icon:  Icon(contrller.hideConfirmPassword.value? Iconsax.eye_slash:Iconsax.eye))),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwnInputFields,
          ),

          //terms & condition
          const TTermsAndConditionCheckbox(),

          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          //Sign Up Butten
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => contrller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          )
        ],
      ),
    );
  }
}
