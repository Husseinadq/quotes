import 'package:flutter/material.dart';
import 'package:quotes/app/color.dart';
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
          title:  Text("Dashbord",style: TextStyle(color: AppColors.primary),),
          backgroundColor:AppColors.secondry,
          
          bottom:  TabBar(
            indicatorColor:AppColors.primary,
            labelColor:AppColors.primary,
            unselectedLabelColor:AppColors.grey,
            labelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            tabs: [
              Tab(
                icon: Icon(Icons.chat_bubble),
                text: "Chats",
              ),
              Tab(
                icon: Icon(Icons.video_call),
                text: "Calls",
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: "Settings",
              ), Tab(
                icon: Icon(Icons.settings),
                text: "Settings",
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
              child: Text("Calls"),
            ),
            Center(
              child: Text("Settings"),
            ),Center(
              child: Text("2"),
            ),
          ],
        ),
      ),
    ));
  }
}
