import 'package:flutter/material.dart';



  Future<dynamic> ShowDialog(BuildContext context,) {
    return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Logout Confirmation'),
                content: Text('Are you sure you want to log out?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      
                      
                    },
                    child: Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); 
                    },
                    child: Text('No'),
                  ),
                ],
              );
            },
          );
  }



