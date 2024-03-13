import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:residential_manager/src/common/widgets/appbar.dart';
import 'package:residential_manager/src/features/authentication/controllers/login/user_conroller.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';
import 'package:residential_manager/src/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      /// Custom AppBar
      appBar: TAppBar(
        title: Text('Re-Authenticate User', style: Theme.of(context).textTheme.headlineSmall),
      ), 
            body: SingleChildScrollView(
              child: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: Form(
                key: controller.reAuthFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.verifyEmail,
                      validator: (value) => TValidator.validateEmail(value),
                      decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
                    ), 
                    const SizedBox(height: TSizes.spaceBtwnInputFields),
                    Obx(
            () => TextFormField(
              validator: (value) => TValidator.validateEmptyText('password',value),
              controller: controller.verifyPassword,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: TTexts.confirmPassword,
                  prefix: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon:  Icon(controller.hidePassword.value? Iconsax.eye_slash:Iconsax.eye))),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
               SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.reAuthenticationWithEmailAndPasswordUser(),
                child: const Text('Verify'),
              ),
                        )
                  ],
                
              ),
               
                        
                      ),
                    ),
            ),
    );
  }
}
