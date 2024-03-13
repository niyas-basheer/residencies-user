import 'package:flutter/material.dart';
import 'package:residential_manager/src/common/widgets/primery_header_container.dart';
import 'package:residential_manager/src/features/authentication/screens/home/widget/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TprimaryHeaderContainer(
            child: Column(
              children: [
               THomeAppBar(),
              ],
            ),
          )
          ],
        ),
      ),
      
    );
  }
}