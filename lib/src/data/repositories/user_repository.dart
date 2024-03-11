import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:residential_manager/src/features/authentication/models/user_models.dart';
import 'package:residential_manager/src/utils/exceptions/firebase_exceptions.dart';
import 'package:residential_manager/src/utils/exceptions/platform_exception.dart';
class UserRepository extends GetxController {
  static UserRepository get instence => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;


 /// Function to save user data to Firestore.
Future<void> saveUserRecord(UserModel user) async {
  try {
    await _db.collection("Users").doc(user.id).set(user.toJson());
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw const FormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}


  }
