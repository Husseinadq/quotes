import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/controller/category_controller.dart';
import 'package:quotes/view/home_screen.dart';
import 'package:quotes/view/start_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CategoryController>().initialized;

    Timer(const Duration(milliseconds: 1000), () {
      // Get.find<UserController>().loginUserFromToken();

      Get.to(StartScreen());
    });
    return Directionality(textDirection: TextDirection.rtl,
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
