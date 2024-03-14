import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/data/repositories/user_repository.dart';
import 'package:residential_manager/src/data/services/network_manager.dart';
import 'package:residential_manager/src/features/authentication/controllers/login/user_conroller.dart';
import 'package:residential_manager/src/features/authentication/screens/profile/profile.dart';
import 'package:residential_manager/src/utils/constants/image_strings.dart';
import 'package:residential_manager/src/utils/popups/full_screen_loader.dart';
import 'package:residential_manager/src/utils/popups/loaders.dart';

class UpdatePhoneNumberController extends GetxController {
  static UpdatePhoneNumberController get instance => Get.find();
  
  final phoneNumber = TextEditingController();

  
  final UserController userController = UserController.instance;
  final UserRepository userRepository = Get.put(UserRepository());
  
  GlobalKey<FormState> updatePhoneNumberFormKey = GlobalKey<FormState>();
  
  // Initialize user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }
  
  /// Fetch user record
  Future<void> initializeNames() async {
    phoneNumber.text = userController.user.value.phoneNumber;
    
  }
  
  Future<void> updatePhoneNumber() async {
    try {
     // Start Loading
TFullScreenLoader.openLoadingDialog('We are updating your information...', TImages.loading);

// Check Internet Connectivity
final isConnected = await NetworkManager.inctance.isConnected();
if (!isConnected) {
    TFullScreenLoader.stopLoading();
    return;
}

// Form Validation
if (!updatePhoneNumberFormKey.currentState!.validate()) {
    TFullScreenLoader.stopLoading();
    return;
}

// Update user's first & last name in the Firebase Firestore
Map<String, dynamic> phonenumber = {'PhoneNumber': phoneNumber.text.trim()};
await userRepository.updateSingleField(phonenumber);

// Update the Rx User value
userController.user.value.phoneNumber = phoneNumber.text.trim();


// Remove Loader
TFullScreenLoader.stopLoading();

// Show Success Message
TLoaders.sucessSnackBar(title: 'Congratulations', message: 'Your PhoneNumber has been updated.');

Get.to(()=>const ProfileScreen());

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    } 
  }
}