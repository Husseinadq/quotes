import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/controller/category_controller.dart';
import 'package:quotes/view/admin/section/edit_section_screen.dart';
import 'package:quotes/view/admin/section/section_card_widget.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Expanded(
          child: FutureBuilder(
            future: Get.find<CategoryController>().getSectionDocumentsForAdmin(),
            builder: (context, snapshot) {  if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.secondry,
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text("error");
                    } else {return GetBuilder<CategoryController>(
                builder: ((sectionController) => sectionController.isLoaded
                    ? ListView.builder(
                        itemCount: sectionController.getSectionsForAdmin.length,
                        itemBuilder: (context, index) =>
                            
                            SectionCartWidget(
                              item: sectionController.getSectionsForAdmin[index],
                            ))
                    : Center(
                        child:
                            CircularProgressIndicator(color: AppColors.primary),
                      )));}}
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.to(AddEditSecitonScreen(
          //   mode: 'Add',
          // ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
