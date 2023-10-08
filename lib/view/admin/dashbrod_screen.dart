import 'package:flutter/material.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/view/admin/category/category_admin_screen.dart';
import 'package:quotes/view/admin/quote/quote_admin_screen.dart';
import 'package:quotes/view/admin/section/section_screen.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({super.key});

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
//  late TabController _tabController=TabController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length:4 ,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: AppColors.primary,
          title:  Text("لوحة التحكم",style: TextStyle(color: AppColors.primary),),
          backgroundColor:AppColors.secondry,
          
          bottom:  TabBar(
            indicatorColor:AppColors.primary,
            labelColor:AppColors.primary,
            unselectedLabelColor:AppColors.grey,
            labelStyle:const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle:const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            tabs:const [
              Tab(
                icon: Icon(Icons.home_max),
                text: "ألاقسام",
              ),
              Tab(
                icon: Icon(Icons.tag),
                text: "الاصناف",
              ),
              Tab(
                icon: Icon(Icons.message),
                text: "اقتباسات",
              ), Tab(
                icon: Icon(Icons.person),
                text: "مستخدمين",
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: SectionScreen(),
            ),
            Center(
              child: CategoryAdminScreen(),
            ),
            Center(
              child: QouteAdminScreen(),
            ),Center(
              child: Text("2"),
            ),
          ],
        ),
      ),
    ));
  }
}
