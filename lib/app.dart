import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/utils/theme/theme.dart';

import 'src/features/authentication/screens/onboarding/on_boarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}

