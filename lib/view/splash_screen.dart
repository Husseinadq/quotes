import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/controller/category_controller.dart';
import 'package:quotes/view/start_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CategoryController>().initialized;
    Get.find<CategoryController>().getSectionDocumentsForAdmin().then((value) {
      print("value");
      Get.to(StartScreen());
    });
    // Timer(const Duration(milliseconds: 1000), () {
    //   // Get.find<UserController>().loginUserFromToken();

    // });
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
            child: Column(
          children: [
            Image.asset(
              "assets/images/slide3.png",
            ),
            Container(
              child: Text(
                "LOTUS SHOPE",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            )
          ],
        )),
      ),
    );
  }
}
