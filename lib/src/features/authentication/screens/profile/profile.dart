import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:residential_manager/src/common/widgets/appbar.dart';
import 'package:residential_manager/src/common/widgets/cercular_image.dart';
import 'package:residential_manager/src/common/widgets/shimmer.dart';
import 'package:residential_manager/src/features/authentication/controllers/login/user_conroller.dart';
import 'package:residential_manager/src/features/authentication/screens/profile/widget/chang_name.dart';
import 'package:residential_manager/src/features/authentication/screens/settings/widgets/section_heading.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';
import 'package:residential_manager/src/utils/constants/size.dart';

import 'widget/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                      (){
                        final networkImage = controller.user.value.profilePicture;
                        final image = networkImage.isEmpty? networkImage:TImages.darkAppLogo;
                        
                        return controller.imageUploading.value? 
                        const TShimmerEffect(width: 80, height: 80,radius: 80,)
                        :TCircularImage(
                        image: image,
                        width: 80,
                        height: 80,
                        isNetworkImage: networkImage.isEmpty,
                      );
                      }
                    ),
                    TextButton(
                        onPressed: ()=> controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ProfileMenu(
                  title: 'Name:', value: controller.user.value.fullName, onPressed: ()=>Get.to(()=>const ChangeName())),
              ProfileMenu(
                  title: 'Username:', value:controller.user.value.username, onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info
              const TSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              
              ProfileMenu(
                  title: 'Email:',
                  value: controller.user.value.email,
                  icon: Iconsax.copy,
                  onPressed: () {}),
              ProfileMenu(
                  title: 'Phone Number:',
                  value: controller.user.value.phoneNumber,
                  onPressed: () {}),
              
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarnigPopup(),
                  child: const Text('Close Account',
                      style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
