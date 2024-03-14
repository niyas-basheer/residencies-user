import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:residential_manager/src/common/widgets/appbar.dart';
import 'package:residential_manager/src/features/authentication/controllers/profile/updatephoneNumber.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';
import 'package:residential_manager/src/utils/validators/validation.dart';

class ChangePhoneNumber extends StatelessWidget {
  const ChangePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneNumberController());
    return Scaffold(
      /// Custom AppBar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Change PhoneNumber', style: Theme.of(context).textTheme.headlineSmall),
      ), 
            body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              'Give your phoneNumber ,it will be used contect you by the service provider.',
              style: Theme.of(context).textTheme.labelMedium,
            ), 
            const SizedBox(height: TSizes.spaceBtwSections),
            
            Form(
  key: controller.updatePhoneNumberFormKey,
  child: Column(
    children: [
      TextFormField(
        controller: controller.phoneNumber,
        validator: TValidator.validatePhoneNumber,
        expands: false,
        decoration: const InputDecoration(labelText: TTexts.phoneNumber, prefixIcon: Icon(Iconsax.call)),
      ), 
    ],
  ),
),
 const SizedBox(height: TSizes.spaceBtwItems),
             SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.updatePhoneNumber(),
              child: const Text('Save'),
            ),
          )
          ],
        ),
      ),
    );
  }
}
