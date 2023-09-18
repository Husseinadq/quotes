import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quotes/view/category_screen.dart';
import 'package:quotes/view/home_screen.dart';
import 'package:quotes/view/profile_screen.dart';

class AppConstants{

  /// start google slidable bottum nav
  static int PAGENUMBER = 0;

 static List<Widget> NAV_BAR_SCREEN = [
      HomeScreen(),
      CategoryScreen(),
      ProfileScreen()
      
  ];

  /// end  google slidable bottum nav
   static GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
}