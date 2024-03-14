import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:residential_manager/src/common/widgets/appbar.dart';
import 'package:residential_manager/src/features/authentication/controllers/profile/updateusername.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';
import 'package:residential_manager/src/utils/validators/validation.dart';

class ChangeUserName extends StatelessWidget {
  const ChangeUserName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUserNameController());
    return Scaffold(
      /// Custom AppBar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Change UserName', style: Theme.of(context).textTheme.headlineSmall),
      ), 
            body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              'Use real name for easy verification.',
              style: Theme.of(context).textTheme.labelMedium,
            ), 
            const SizedBox(height: TSizes.spaceBtwSections),
            
            Form(
  key: controller.updateusernameFormKey,
  child: Column(
    children: [
      TextFormField(
        controller: controller.userName,
        validator: (value) => TValidator.validateEmptyText('User name', value),
        expands: false,
        decoration: const InputDecoration(labelText: TTexts.username, prefixIcon: Icon(Iconsax.user)),
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
