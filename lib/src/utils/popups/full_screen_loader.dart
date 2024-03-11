import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/common/widgets/animation_loader.dart';
import 'package:residential_manager/src/utils/constants/colors.dart';
import 'package:residential_manager/src/utils/helpers/helper_function.dart';

class TFullScreenLoader {


  static void openLoadingDialog(String text, String animation){
    showDialog(context: Get.overlayContext!,
    barrierDismissible: false,
     builder: (_)=>PopScope(
      canPop: false,
      child: Container(
        color: THelperFunction.isDarkMode(Get.context!)?Tcolors.dark:Tcolors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 250),
            TAnimationLoaderWidget(text:text,animation:animation),
          ],
        ),
      )));
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}