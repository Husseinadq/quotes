import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/controller/category_controller.dart';
import 'package:quotes/view/admin/category/add_edit_category_screen.dart';
import 'package:quotes/view/admin/category/category_card_widget.dart';
import 'package:quotes/view/admin/section/section_card_widget.dart';

class CategoryAdminScreen extends StatefulWidget {
  const CategoryAdminScreen({super.key});

  @override
  State<CategoryAdminScreen> createState() => _CategoryAdminScreenState();
}

class _CategoryAdminScreenState extends State<CategoryAdminScreen> {
  int _active=0;
  @override
  Widget build(BuildContext context) {
    Get.find<CategoryController>().getCategoryDocumentsForAdmin(
        parentId:  Get.find<CategoryController>().getSectionsForAdmin[_active].id);
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: FutureBuilder(
                  future: Get.find<CategoryController>()
                      .getSectionDocumentsForAdmin(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.secondry,
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text("error");
                    } else {
                      return GetBuilder<CategoryController>(
                          builder: ((sectionController) => sectionController
                                  .isLoaded
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: sectionController
                                      .getSectionsForAdmin.length,
                                  itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          Get.find<CategoryController>()
                                              .getCategoryDocumentsForAdmin(
                                                  parentId: sectionController
                                                      .getSectionsForAdmin[
                                                          index]
                                                      .id);
                                                      _active=index;
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                         padding: EdgeInsets.symmetric(horizontal: 20),
                                          
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border(
                                                 top: BorderSide(color:    AppColors.secondry, ),
                                                 right: BorderSide(color:    AppColors.secondry, ),
                                                 left: BorderSide(color:    AppColors.secondry, ),
                                                 bottom: BorderSide(color:    AppColors.secondry,width: _active==index?5:1 ),
                                                 ),
                                              color: AppColors.primary),
                                          child: Center(
                                            child: Text(
                                              sectionController
                                                  .getSectionsForAdmin[index]
                                                  .name,
                                              style: TextStyle(
                                                  color: AppColors.secondry),
                                            ),
                                          ),
                                        ),
                                      ))
                              : Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.primary),
                                )));
                    }
                  }),
            ),
            Expanded(
              flex: 8,
              child: FutureBuilder(
                  future: Get.find<CategoryController>()
                      .getSectionDocumentsForAdmin(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.secondry,
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text("error");
                    } else {
                      return GetBuilder<CategoryController>(
                          builder: ((categoryController) =>
                              categoryController.isLoaded
                                  ? ListView.builder(
                                      itemCount: categoryController
                                          .getCategoiesForAdmin.length,
                                      itemBuilder: (context, index) =>
                                          CategoryCartWidget(
                                            item: categoryController
                                                .getCategoiesForAdmin[index],
                                          ))
                                  : Center(
                                      child: CircularProgressIndicator(
                                          color: AppColors.primary),
                                    )));
                    }
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddEditCategoryScreen(
            mode: 'Add',
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
