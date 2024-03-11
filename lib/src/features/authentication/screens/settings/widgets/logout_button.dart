import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:residential_manager/src/features/authentication/controllers/signout/signout_controllers.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contrller = Get.put(SignoutController());
    return SizedBox(width: double.infinity,
    child: OutlinedButton(onPressed: ()=>showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout Confirmation'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
    TextButton(
      onPressed: () =>contrller.signout(),
      child: const Text('Yes'),
    ),
    TextButton(
      onPressed: () {
        Navigator.of(context).pop(); 
      },
      child: const Text('No'),
    ),
                    ],
                  );
                },
              ), child: const Text('Logout')),
    );
  }
}
