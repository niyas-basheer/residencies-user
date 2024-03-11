import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:residential_manager/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:residential_manager/src/data/repositories/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  ///widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// getx local storage
  await GetStorage.init();

  /// -- await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  /// initialize firebase & authentication repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then
  ((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}
