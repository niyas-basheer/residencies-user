import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:residential_manager/src/data/repositories/authentication_repository.dart';
import 'package:residential_manager/src/data/services/network_manager.dart';
import 'package:residential_manager/src/features/authentication/controllers/login/user_conroller.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';
import 'package:residential_manager/src/utils/popups/full_screen_loader.dart';
import 'package:residential_manager/src/utils/popups/loaders.dart';

class LoginController extends GetxController {
  
  ///-- variables
  final localStorage = GetStorage();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
 
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
 final userController = Get.put(UserController());
  @override
  void onInit(){
    super.onInit();
    email.text = localStorage.read('REMEMBER_ME_EMAIL')??'';
  password.text = localStorage.read('REMEMBER_ME_PASSWORD')??'';
  }

  ///--EMAIL AND PASSWORD SIGNIN
  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging you in', TImages.loading);
      final isConnected = await NetworkManager.inctance.isConnected();
      if (!isConnected) {
         TFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
         TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(
              email.text.trim(), password.text.trim());

       TFullScreenLoader.stopLoading();

       AuthenticationRepository.instance.screenRedirect();        

      
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }

  Future<void> googleSignIn()async{
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in.... ', TImages.loading);

      final isConnected = await NetworkManager.inctance.isConnected();
      if (!isConnected) {
         TFullScreenLoader.stopLoading();
        return;
      }
      
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

     await userController.savUserRecord(userCredentials);

     TFullScreenLoader.stopLoading();

     AuthenticationRepository.instance.screenRedirect();
          
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh snap',message: e.toString());
    }
  }
}