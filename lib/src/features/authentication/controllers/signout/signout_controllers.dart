import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/data/repositories/authentication_repository.dart';
import 'package:residential_manager/src/data/services/network_manager.dart';
import 'package:residential_manager/src/features/authentication/screens/login/login.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';
import 'package:residential_manager/src/utils/popups/full_screen_loader.dart';
import 'package:residential_manager/src/utils/popups/loaders.dart';


class SignoutController extends GetxController {
  static SignoutController get instance => Get.find();

  ///-- variables
  GlobalKey<FormState> signoutFormKey = GlobalKey<FormState>();

  ///SIGNOUT
  Future<void> signout() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging out... ', TImages.loading);
      final isConnected = await NetworkManager.inctance.isConnected();
      if (!isConnected) {
         TFullScreenLoader.stopLoading();
        return;
      }

       await AuthenticationRepository.instance
          .logout();

      TFullScreenLoader.stopLoading();

      TLoaders.sucessSnackBar(
          title: 'Logged Out',
          message: 'your account has been Logged out');

      Get.offAll(() =>const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }
}
