import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/view/admin/dashbrod_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(body: InkWell(onTap: () {
      Get.to(DashbordScreen());
    }, child: Container(child: Text('dashbord'),))),);
  }
}