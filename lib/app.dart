import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/bindings/general_bindings.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';
import 'package:residential_manager/src/utils/theme/theme.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      initialBinding: GeneralBindings(),
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const Scaffold(backgroundColor: Tcolors.primary,body: Center(child: CircularProgressIndicator(color: Colors.white,),),)
    );
  }
}

