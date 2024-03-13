import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:residential_manager/src/common/widgets/cercular_image.dart';
import 'package:residential_manager/src/features/authentication/controllers/login/user_conroller.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key, required this.onPressed,
  });

final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return  ListTile(
     leading:  const TCircularImage(
       image: TImages.darkAppLogo,
       width: 50,
       height: 50,
       padding: 0,
       
     ),
     title: Text(
         controller.user.value.fullName,
         style: Theme.of(context)
             .textTheme
             .headlineSmall!
             .apply(color: Tcolors.white),
       ),
       subtitle:Text(
         controller.user.value.email,
         style: Theme.of(context)
             .textTheme
             .bodyMedium!
             .apply(color: Tcolors.white),
       ), 
       trailing: IconButton(onPressed: onPressed,icon: const Icon(Iconsax.edit,color: Tcolors.white,),),
    );
  }
}
