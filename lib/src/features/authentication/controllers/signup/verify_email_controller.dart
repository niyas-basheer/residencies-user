import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/common/widgets/success_screen.dart';
import 'package:residential_manager/src/data/repositories/authentication_repository.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';
import 'package:residential_manager/src/utils/constants/text_strings.dart';
import 'package:residential_manager/src/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    setTimerForAutoRedirect();
    sendEmailVerification();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.sucessSnackBar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verfy your email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImages.success,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

checkEmailVerificationStatus()async{
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null && currentUser.emailVerified) {
    Get.off(() => SuccessScreen(
            image: TImages.success,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
  }
}

}
