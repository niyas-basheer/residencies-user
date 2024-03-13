import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:residential_manager/src/common/widgets/appbar.dart';
import 'package:residential_manager/src/features/authentication/controllers/profile/updateuser.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';
import 'package:residential_manager/src/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom AppBar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall),
      ), 
            body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ), 
            const SizedBox(height: TSizes.spaceBtwSections),
            
            Form(
  key: controller.updateUserNameFormKey,
  child: Column(
    children: [
      TextFormField(
        controller: controller.firstName,
        validator: (value) => TValidator.validateEmptyText('First name', value),
        expands: false,
        decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
      ), 
      const SizedBox(height: TSizes.spaceBtwnInputFields),
      TextFormField(
        controller: controller.lastName,
        validator: (value) => TValidator.validateEmptyText('Last name', value),
        expands: false,
        decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
      ), 
    ],
  ),
),
 const SizedBox(height: TSizes.spaceBtwItems),
             SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.updateUserName(),
              child: const Text('Save'),
            ),
          )
          ],
        ),
      ),
    );
  }
}
