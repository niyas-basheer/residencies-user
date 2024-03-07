
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class THelperFuction {

  static Color getColor(String value) {
    switch (value) {
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'pink':
        return Colors.pink;
      case 'grey':
        return Colors.grey;
      case 'purple':
        return Colors.purple;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      default:
        return Colors.black; // Default color
    }
  }

  static showStatusBar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
  
  static  screenSize(){
    return MediaQuery.of(Get.context!).size;
  }

 static  screenHight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  } 

  static void showAlert(String title, String message) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}


static void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (__) => screen),
  );
}

static String truncateText(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}

static bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}



}