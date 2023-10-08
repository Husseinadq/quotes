import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/controller/category_controller.dart';
import 'package:quotes/controller/quote_controller.dart';
import 'package:quotes/model/quote.dart';

// ignore: must_be_immutable
class AddEditQuoteScreen extends StatelessWidget {
  Quote? quote;
  String mode;
  AddEditQuoteScreen({this.quote, required this.mode, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$mode Quote')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.maxFinite,
            color: AppColors.primary,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                        "اضف ما تعتقد انه جميل",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      )
                    ],
                  ),
                ),
               ],),
                SizedBox(
                  height: 10,
                ),
                AddEditQuoteScreenWidget(
                  quote: quote,
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
class AddEditQuoteScreenWidget extends StatefulWidget {
  Quote? quote;
  bool newCategory;
  AddEditQuoteScreenWidget({required this.newCategory, this.quote, super.key});

  @override
  State<AddEditQuoteScreenWidget> createState() =>
      _AddEditCategoryScreenWidgetState();
}

class _AddEditCategoryScreenWidgetState
    extends State<AddEditQuoteScreenWidget> {
  final _formKey = GlobalKey<FormState>();
  String? initValue;
  final TextEditingController quoteTextController = TextEditingController();
  final TextEditingController autherTextController = TextEditingController();
  int _activeSection = -1;
  int _activeCategory = -1;
  String _sectionId = '';
  String _categoryId = '';
  bool _isSectionSelected = false;
  bool _isCategorySelected = false;

  @override
  void initState() {
    // initValue = widget.category.name;
    if (!widget.newCategory) {
      quoteTextController.text = widget.quote!.context;
    }

    super.initState();
  }

  @override
  void dispose() {
    quoteTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _getSection(),
            _isSectionSelected ? _getCategory() : Container(),
            SizedBox(
              height: 20,
            ),
            _isCategorySelected
                ? Column(
                    children: [
                      TextFormField(
                        controller: autherTextController,
                        maxLines: 1,
                        
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all( 5),
                          labelText: 'أدخل اسم قائل الاقتباس',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: 'قائل الاقتباس',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل نص الاقتباس ';
                          }
                          if (value.length > 15) {
                            return 'ادخل محتواء اقل من 15 حرف';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        onSaved: (newValue) {},
                      ),SizedBox(height: 10,),
                      TextFormField(
          
                        controller: quoteTextController,
                        maxLines: 2,
                        decoration: InputDecoration(
                           contentPadding: EdgeInsets.all( 10),
                          labelText: 'أدخل نص الاقتباس',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: 'نص الاقتباس',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل نص الاقتباس ';
                          }
                          if (value.length < 15) {
                            return 'ادخل محتواء اكثر من 15 حرف';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        onSaved: (newValue) {},
                      ),
                    ],
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
                      Get.find<QuoteController>().createQuote(
                          quote: Quote(
                              id: 'id',
                              context: quoteTextController.text,
                              author: autherTextController.text,
                              publisherId: 'MQzock0UA21PJJ82UaGI',
                              category: _categoryId,
                              status: false,
                              likes: 0));
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
                        'أضافة',
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

  Widget _getSection() {
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
                                  _isCategorySelected = false;
                                  _activeSection = index;
                                  _activeCategory = -1;
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
                                            width: _activeSection == index
                                                ? 5
                                                : 1),
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

  Widget _getCategory() {
    return Container(
      height: 50,
      child: FutureBuilder(
          future: Get.find<CategoryController>()
              .getCategoryDocumentsForAdmin(parentId: _sectionId),
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
                  builder: ((categoryController) => categoryController.isLoaded
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              categoryController.getCategoiesForAdmin.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  _categoryId = categoryController
                                      .getCategoiesForAdmin[index].id;
                                  _isCategorySelected = true;
                                  _activeCategory = index;
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
                                            width: _activeCategory == index
                                                ? 5
                                                : 1),
                                      ),
                                      color: AppColors.primary),
                                  child: Center(
                                    child: Text(
                                      categoryController
                                          .getCategoiesForAdmin[index].name,
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
