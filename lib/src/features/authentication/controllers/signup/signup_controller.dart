import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/data/repositories/authentication_repository.dart';
import 'package:residential_manager/src/data/repositories/user_repository.dart';
import 'package:residential_manager/src/data/services/network_manager.dart';
import 'package:residential_manager/src/features/authentication/models/user_models.dart';
import 'package:residential_manager/src/features/authentication/screens/signup/verify_email.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';
import 'package:residential_manager/src/utils/popups/full_screen_loader.dart';
import 'package:residential_manager/src/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///-- variables
  final privecypolicy = true.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///SIGNUP
  Future<void> signup() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information... ', TImages.loading);
      final isConnected = await NetworkManager.inctance.isConnected();
      if (!isConnected) {
         TFullScreenLoader.stopLoading();
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
         TFullScreenLoader.stopLoading();
        return;
      }

      if (!privecypolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept privecypolicy',
          message:
              'in order to create account, you must have to read and accept the privacy & terms of use.',
        );
        return;
      }

      final user = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newuser = UserModel(
        id: user.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newuser);

      TFullScreenLoader.stopLoading();

      TLoaders.sucessSnackBar(
          title: 'Congratulation',
          message: 'your account has been created! verify email to continue');

      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }
}
