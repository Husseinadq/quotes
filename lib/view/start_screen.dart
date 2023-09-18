import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/app/constants.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AppConstants.NAV_BAR_SCREEN[AppConstants.PAGENUMBER],
        bottomNavigationBar: CurvedNavigationBar(
            key: AppConstants.bottomNavigationKey,
            height:60,
            onTap: (index) {
              setState(() {
                AppConstants.PAGENUMBER = index;
              });
            },
            index: AppConstants.PAGENUMBER,
            backgroundColor: AppColors.secondry,
            color: AppColors.primary,
            animationDuration: const Duration(milliseconds: 600),
            items: [
              CurvedNavigationBarItem(
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color: AppColors.secondry,
                  ),
                  label: 'Home',
                  labelStyle: TextStyle(color: AppColors.secondry)),
              CurvedNavigationBarItem(
                  child: Icon(
                    Icons.category,
                    size: 30,
                    color: AppColors.secondry,
                  ),
                  label: 'Category',
                  labelStyle: TextStyle(color: AppColors.secondry)),
            CurvedNavigationBarItem(
                label: 'Profile',
                labelStyle: TextStyle(color: AppColors.secondry),
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: AppColors.secondry,
                ),
              ),
            ]),
      ),
    );
  }
}
