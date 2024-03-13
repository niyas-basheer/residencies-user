import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:residential_manager/src/data/repositories/authentication_repository.dart';
import 'package:residential_manager/src/data/repositories/user_repository.dart';
import 'package:residential_manager/src/data/services/network_manager.dart';
import 'package:residential_manager/src/features/authentication/models/user_models.dart';
import 'package:residential_manager/src/features/authentication/screens/login/login.dart';
import 'package:residential_manager/src/features/authentication/screens/profile/widget/re_authenticate_user_login_form.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';
import 'package:residential_manager/src/utils/constants/size.dart';
import 'package:residential_manager/src/utils/popups/full_screen_loader.dart';
import 'package:residential_manager/src/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> savUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
              username: username,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '');

          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Somthing went wrong while saving you information. You can Re_save your data in your Profile');
    }
  }

  void deleteAccountWarnigPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'delete Account',
      middleText:
          'Are you sur you want to delete your account permanently? This action is not reversible and all of your data will be removed premanently.',
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel')),
    );
  }

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.loading);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re-verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticationWithEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.loading);
      final isConnected = await NetworkManager.inctance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticationWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());

      await AuthenticationRepository.instance.deleteAccount();

      TFullScreenLoader.stopLoading();

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }

  uploadUserProfilePicture() async{
   try {
     final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);
   if (image != null) {
    imageUploading.value = true;
     final imageUrl = await userRepository.uploadImage('User/Images/Profile', image);

     Map<String,dynamic>json = {'ProfilePicture': imageUrl};
     await userRepository.updateSingleField(json);

     user.value.profilePicture = imageUrl;
     user.refresh();
     TLoaders.sucessSnackBar(title: 'Congratulations', message: 'Your Profile image has been updated');
     
   }
   } catch (e) {
     TLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
   }finally{
    imageUploading.value = false;
   }
  }
}
