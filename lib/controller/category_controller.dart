
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryController extends GetxController {
  CategoryController();

  List<Category> _sections = [];
  List<Category> _section = [];
  List<Category> _categories = [];
  List<Category> _category = [];
  bool _isLoaded=false;

  final firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot<Map<String, dynamic>>> documents = [];
  int get getSectionsCount => _sections.length;
  List<Category> get getSections => _sections;
  List<Category> get getSection => _section;
  bool get isLoaded => _isLoaded;

  Future<void> getSectionDocuments() async {
    final querySnapshot = await firestore
        .collection('category')
        .where('parentId', isEqualTo: '3Bwmo6yiWqZ1UDDkgJno')
        .get();
    _sections = [];
    documents = querySnapshot.docs;
    documents.forEach((element) {
      _sections.add(Category.fromJson(element.data()!));
    });
_isLoaded=true;
    // print(_sections[0].name);
  }

   Future<void> getSectionDocument({id}) async {
    final querySnapshot = await firestore
        .collection('category')
        .where('id', isEqualTo: id)
        .get();
    _section = [];
    documents = querySnapshot.docs;
    documents.forEach((element) {
      _section.add(Category.fromJson(element.data()!));
    });

    // print(_sections[0].name);
  }

  void createSection({required name}) async {
    final docRef = firestore.collection('category').doc();
    Category category = Category(
        id: docRef.id,
        name: name,
        parentId: '3Bwmo6yiWqZ1UDDkgJno',
        status: true);

//Add document to Firestore with an auto-generated Id
    await docRef
        .set(category.toJson())
        .whenComplete(() => snackbar(
            title: 'تم',
            message: 'لقد تم اضافة القسم بنجاح',
            color: Colors.green))
        .catchError((error) {
      snackbar(title: 'خطاء', message: 'لقد حدث خطاء ', color: Colors.red);
    });
  }

void updateSection({required name ,required id}) async {
    final docRef = firestore.collection('category').doc(id);
    Category category = Category(
        id: docRef.id,
        name: name,
        parentId: '3Bwmo6yiWqZ1UDDkgJno',
        status: true);

//Add document to Firestore with an auto-generated Id
    await docRef
        .set(category.toJson())
        .whenComplete(() => snackbar(
            title: 'تم',
            message: 'لقد تم اضافة القسم بنجاح',
            color: Colors.green))
        .catchError((error) {
      snackbar(title: 'خطاء', message: 'لقد حدث خطاء ', color: Colors.red);
    });
  }

  void createCategory({required name, required parentId}) async {
    final docRef = firestore.collection('category').doc();
    Category category =
        Category(id: docRef.id, name: name, parentId: parentId, status: true);

//Add document to Firestore with an auto-generated Id
    await docRef
        .set(category.toJson())
        .whenComplete(() => snackbar(
            title: 'تم',
            message: 'لقد تم اضافة الصنف بنجاح',
            color: Colors.green))
        .catchError((error) => snackbar(
            title: 'خطاء', message: 'لقد حدث خطاء', color: Colors.red));
  }

  snackbar({required title, required message, required color}) {
    return Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.grey,
        colorText: color);
  }
// Future getSections()async{
//   // firestore.collection('collectionPath').where('field').s
//   final data= firestore.collection('collectionPath').doc().where('parentId', isEqualTo: '3Bwmo6yiWqZ1UDDkgJno').snapshots();
// print(data);
// }
}
