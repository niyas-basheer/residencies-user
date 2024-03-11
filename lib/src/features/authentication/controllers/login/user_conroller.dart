import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/data/repositories/user_repository.dart';
import 'package:residential_manager/src/features/authentication/models/user_models.dart';
import 'package:residential_manager/src/utils/popups/loaders.dart';

class UserController extends GetxController{
  static UserController get Instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<void> savUserRecord(UserCredential? userCredential)async{
    try {
      if (userCredential != null) {
        final nameParts = UserModel.nameParts(userCredential.user!.displayName??'');
        final username= UserModel.generateUsername(userCredential.user!.displayName??'');

        final user= UserModel(
          id: userCredential.user!.uid,
           firstName:nameParts[0] , 
           lastName: nameParts.length > 1 ? nameParts.sublist(1).join(''):'',
           username: username,
           email: userCredential.user!.email ?? '', 
           phoneNumber: userCredential.user!.phoneNumber ?? '',
           profilePicture: userCredential.user!.photoURL??'');

           await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Somthing went wrong while saving you information. You can Re_save your data in your Profile');
    }
  }
}