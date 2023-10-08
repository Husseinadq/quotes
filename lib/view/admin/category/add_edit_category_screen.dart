import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/controller/category_controller.dart';
import 'package:quotes/model/category.dart';

// ignore: must_be_immutable
class AddEditCategoryScreen extends StatelessWidget {
  Category? category;
  String mode;
  AddEditCategoryScreen({this.category, required this.mode, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$mode Category')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.maxFinite,
            color: AppColors.primary,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   child: Text(
                //     "LOGIN",
                //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                //   ),
                // ),
                Row(children: [
Container(
                  height: 100,
                  child: Icon(Icons.quora_outlined),
                ),
                Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "مرحبا بك ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "اضف ما يعبر عنك في نص جميل",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      )
                    ],
                  ),
                ),
                ],),
                
                SizedBox(
                  height: 20,
                ),
                AddEditCategoryScreenWidget(
                  category: category,
                  newCategory: mode == 'Add' ? true : false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AddEditCategoryScreenWidget extends StatefulWidget {
  Category? category;
  bool newCategory;
  AddEditCategoryScreenWidget(
      {required this.newCategory, this.category, super.key});

  @override
  State<AddEditCategoryScreenWidget> createState() =>
      _AddEditCategoryScreenWidgetState();
}

class _AddEditCategoryScreenWidgetState
    extends State<AddEditCategoryScreenWidget> {
  final _formKey = GlobalKey<FormState>();
  String? initValue;
  final TextEditingController categoryTextController = TextEditingController();
  int _active = -1;
  String _sectionId = '';
  bool _isSectionSelected = false;

  @override
  void initState() {
    // initValue = widget.category.name;
    if (!widget.newCategory) {
      categoryTextController.text = widget.category!.name;
      _isSectionSelected=true;
    }

    super.initState();
  }

  @override
  void dispose() {
    categoryTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            widget.newCategory ? getParent() : Container(),
            SizedBox(
              height: 20,
            ),
            _isSectionSelected
                ? TextFormField(
                    controller: categoryTextController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: 'أدخل اسم الصنف',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'أسم الصنف',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ادخل قيمة ';
                      }
                      if (value.length > 15) {
                        return 'ادخل اسم اقم من 15 حرف';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                    onSaved: (newValue) {},
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: AppColors.secondry, width: 2)),
                      child: Text(
                        'الغاء',
                        style:
                            TextStyle(color: AppColors.secondry, fontSize: 20),
                      )),
                ),
                // Spacer(),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                     widget.newCategory? Get.find<CategoryController>().createCategory(
                          name: categoryTextController.text,
                          parentId: _sectionId): Get.find<CategoryController>().updateCategory(
                          name: categoryTextController.text,
                          id: widget.category!.id,
                          parentId: widget.category!.parentId);
                      Get.back();
                      setState(() {});
                    }
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.secondry),
                      child: Text(
                       widget.newCategory? 'أضافة':'تعديل',
                        style:
                            TextStyle(color: AppColors.primary, fontSize: 20),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getParent() {
    return Container(
      height: 50,
      child: FutureBuilder(
          future: Get.find<CategoryController>().getSectionDocumentsForAdmin(),
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
                  builder: ((sectionController) => sectionController.isLoaded
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              sectionController.getSectionsForAdmin.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  _sectionId = sectionController
                                      .getSectionsForAdmin[index].id;
                                  _isSectionSelected = true;
                                  _active = index;
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  height: 50,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border(
                                        top: BorderSide(
                                          color: AppColors.secondry,
                                        ),
                                        right: BorderSide(
                                          color: AppColors.secondry,
                                        ),
                                        left: BorderSide(
                                          color: AppColors.secondry,
                                        ),
                                        bottom: BorderSide(
                                            color: AppColors.secondry,
                                            width: _active == index ? 5 : 1),
                                      ),
                                      color: AppColors.primary),
                                  child: Center(
                                    child: Text(
                                      sectionController
                                          .getSectionsForAdmin[index].name,
                                      style:
                                          TextStyle(color: AppColors.secondry),
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
    );
  }
}
