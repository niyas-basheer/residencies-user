import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/common/widgets/appbar.dart';
import 'package:residential_manager/src/common/widgets/carticon.dart';
import 'package:residential_manager/src/common/widgets/shimmer.dart';
import 'package:residential_manager/src/features/authentication/controllers/login/user_conroller.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( TTexts.homeAppBarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: Tcolors.grey)),
          Obx(() {
            if (controller.profileLoading.value) {
              return const TShimmerEffect(width: 80, height:15);
            }
            return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: Tcolors.white));}
            ),
        ],
      ),
      actions: [
       TcartCounterIcon(onPressed: () {}, iconColor: Tcolors.white,),
       // counterBgColor: Tcolors.dark, counterTextColor:Tcolors.white
      ],
    );
  }
}
