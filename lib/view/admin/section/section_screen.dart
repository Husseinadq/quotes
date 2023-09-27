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
          child: GetBuilder<CategoryController>(
              builder: ((sectionController) => sectionController.isLoaded
                  ? ListView.builder(
                      itemCount: sectionController.getSectionsCount,
                      itemBuilder: (context, index) =>
                          // ProductCartWidget(
                          //
                          // )
                          SectionCartWidget(
                            item: sectionController.getSections[index],
                          ))
                  : Center(
                      child:
                          CircularProgressIndicator(color: AppColors.primary),
                    ))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(AddEditSecitonScreen(
          mode: 'Add',
        )),
        child: Icon(Icons.add),
      ),
    );
  }
}
