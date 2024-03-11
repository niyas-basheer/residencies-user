import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:residential_manager/src/features/authentication/screens/home/home.dart';
import 'package:residential_manager/src/features/authentication/screens/settings/settings.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';
import 'package:residential_manager/src/utils/helpers/helper_function.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunction.isDarkMode(context);
    final controller = Get.put(NavigationCantroller());
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
        backgroundColor:darkMode? Tcolors.dark:Tcolors.white ,
        indicatorColor:darkMode? Tcolors.white.withOpacity(0.1):Tcolors.dark.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.book), label: "Booking"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ],
        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationCantroller extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
   const HomeScreen(),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.orange,
    ),
    const SettingsScreen(),
  ];
}
