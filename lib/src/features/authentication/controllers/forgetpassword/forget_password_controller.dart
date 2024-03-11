
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/data/repositories/authentication_repository.dart';
import 'package:residential_manager/src/data/services/network_manager.dart';
import 'package:residential_manager/src/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';
import 'package:residential_manager/src/utils/popups/full_screen_loader.dart';
import 'package:residential_manager/src/utils/popups/loaders.dart';


class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

 final email = TextEditingController();
GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

sendPasswordResetEmail() async{
  try {
    TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.loading);
    final isConnected = await NetworkManager.inctance.isConnected();
if (!isConnected) {
         TFullScreenLoader.stopLoading();
        return;
      }

  if (!forgetPasswordFormKey.currentState!.validate()) {
         TFullScreenLoader.stopLoading();
        return;
      }

   await AuthenticationRepository.instance
          .sendPassewordResetEmail(
              email.text.trim());

      TFullScreenLoader.stopLoading();

      TLoaders.sucessSnackBar(title: 'Email Send',message: 'Email Link Send to Reset your Password'.tr);   

      Get.to(()=>ResetPassword(email:email.text.trim()));     

  } catch (e) {
    TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
  }
}

resendPasswordResetEmail(String email) async{
  try {
    TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.loading);
    final isConnected = await NetworkManager.inctance.isConnected();
if (!isConnected) {
         TFullScreenLoader.stopLoading();
        return;
      }

  
   await AuthenticationRepository.instance
          .sendPassewordResetEmail(email);

      TFullScreenLoader.stopLoading();

      TLoaders.sucessSnackBar(title: 'Email Send',message: 'Email Link Send to Reset your Password');   

AuthenticationRepository.instance.screenRedirect();
       
  } catch (e) {
    TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
  }
}
}
