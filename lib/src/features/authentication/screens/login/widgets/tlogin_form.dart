import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:residential_manager/src/features/authentication/controllers/login/login_conttrollers.dart';
import 'package:residential_manager/src/features/authentication/screens/password_configuration/forget_pasword.dart';
import 'package:residential_manager/src/features/authentication/screens/signup/signup.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';
import 'package:residential_manager/src/utils/validators/validation.dart';

class TloginForm extends StatelessWidget {
  const TloginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contrller = Get.put(LoginController());
    return Form(
      key: contrller.loginFormKey,
        child: Padding(
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            controller: contrller.email,
             validator:TValidator.validateEmail,
            
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email),
          ),
          const SizedBox(
            height: TSizes.spaceBtwnInputFields,
          ),
          Obx(
            ()=>TextFormField(
              validator: (value) => TValidator.validateEmptyText('Password',value),
                controller: contrller.password,
              obscureText: contrller.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: IconButton(
                        onPressed: () => contrller.hidePassword.value =
                            !contrller.hidePassword.value,
                        icon:  Icon(contrller.hidePassword.value? Iconsax.eye_slash:Iconsax.eye)),
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwnInputFields / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(()=> Checkbox(value: contrller.rememberMe.value, 
                  onChanged: (Value)=> contrller.rememberMe.value = !contrller.rememberMe.value)),
                  const Text(TTexts.rememberMe),
                ],
              ),
              TextButton(
                onPressed: () =>Get.to(()=> const ForgetPasswordScreen()),
                child: const Text(TTexts.forgetPassword),
              ),
            ],
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:() =>contrller.emailAndPasswordSignIn(),
                child: const Text(TTexts.signIn),
              )),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                
                onPressed: () => Get.to(()=> const SignupScreen()),
                child: const Text(TTexts.createAccount),
              ))
        ],
      ),
    ));
  }
}
