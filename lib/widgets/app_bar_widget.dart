import 'package:flutter/material.dart';
import 'package:quotes/app/color.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30,right: 30,top: 10),
      width: double.maxFinite,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.secondry),
      child: Center(
        child: Text(
          'انشاء اقتباس',
          style: TextStyle(color: AppColors.primary),
        ),
      ),
    );
  }
}
