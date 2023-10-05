import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/controller/category_controller.dart';
import 'package:quotes/widgets/app_bar_widget.dart';
import 'package:quotes/widgets/section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(

            // scrollDirection: Axis.vertical,
            child: Column(
          children: [
            const AppBarWidget(),
            SizedBox(
              height: 620,
              child: FutureBuilder(
                  future: Get.find<CategoryController>().getSectionDocuments(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.secondry,
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Text("error");
                    } else {
                      return
                       ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount:
                              Get.find<CategoryController>().getSectionsCount,
                          itemBuilder: (BuildContext context, index) {
                            return SectionWidget(
                              categories: Get.find<CategoryController>().getAll[
                                  Get.find<CategoryController>()
                                      .getSections[index]
                                      .name
                                      .toString()]!,
                              sectionName: Get.find<CategoryController>()
                                  .getSections[index]
                                  .name,
                            );
                          });
                    }
                  }),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // CategoryController().createSection(name: 'انمي');
          },
          backgroundColor: AppColors.secondry,
          child: Icon(
            Icons.add,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
