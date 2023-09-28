import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryController extends GetxController {
  CategoryController();

//////////// Sections ///////////
  List<Category> _sections = [];
  List<Category> _sectionsForAdmin = [];
  List<Category> _section = [];

  List<Category> get getSections => _sections;
  List<Category> get getSectionsForAdmin => _sectionsForAdmin;
  List<Category> get getSection => _section;
  int get getSectionsCount => _sections.length;


//////////// Category ///////////
  List<Category> _categories = [];
  List<Category> _categoriesForAdmin = [];
  List<Category> _category = [];
 List<Category> get getCategories => _categories;
  List<Category> get getCategoiesForAdmin => _categoriesForAdmin;
  List<Category> get getCategory => _category;

//////////// var ///////
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  final firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot<Map<String, dynamic>>> documents = [];


  

  ///////////////////////////////////////////////////
  ////////////// Start Admin Side Function //////////
  ///////////////////////////////////////////////////
////// categories //////
  // get category documents //
  Future<void> getCategoryDocumentsForAdmin({required parentId}) async {
    _isLoaded = false;
    final querySnapshot = await firestore
        .collection('category')
        .where('parentId', isEqualTo: parentId.toString())
        .get();
    _categoriesForAdmin = [];
    documents = querySnapshot.docs;
    documents.forEach((element) {
      _categoriesForAdmin.add(Category.fromJson(element.data()!));
    });
    _isLoaded = true;
  }

  // create documents //
  void createCategory({required name, required parentId}) async {
    _isLoaded = false;
    final docRef = firestore.collection('category').doc();
    Category category =
        Category(id: docRef.id, name: name, parentId: parentId, status: true);
    await docRef
        .set(category.toJson())
        .whenComplete(() => snackbar(
            title: 'تم',
            message: 'لقد تم اضافة الصنف بنجاح',
            color: Colors.green))
        .catchError((error) => snackbar(
            title: 'خطاء', message: 'لقد حدث خطاء', color: Colors.red));
    _isLoaded = true;
  }


////// sections //////
// get section documents //
  Future<void> getSectionDocumentsForAdmin() async {
    _isLoaded = false;
    final querySnapshot = await firestore
        .collection('category')
        .where('parentId', isEqualTo: '3Bwmo6yiWqZ1UDDkgJno')
        .get();
    _sectionsForAdmin = [];
    documents = querySnapshot.docs;
    documents.forEach((element) {
      _sectionsForAdmin.add(Category.fromJson(element.data()!));
    });
    _isLoaded = true;
  }

// create sections documents //
  void createSection({required name}) async {
    _isLoaded = false;
    final docRef = firestore.collection('category').doc();
    Category category = Category(
        id: docRef.id,
        name: name,
        parentId: '3Bwmo6yiWqZ1UDDkgJno',
        status: true);
    await docRef
        .set(category.toJson())
        .whenComplete(() => snackbar(
            title: 'تم',
            message: 'لقد تم اضافة القسم بنجاح',
            color: Colors.green))
        .catchError((error) {
      snackbar(title: 'خطاء', message: 'لقد حدث خطاء ', color: Colors.red);
    });
    _isLoaded = true;
  }

//// update section /////
  void updateSection({required name, required id}) async {
    _isLoaded = false;
    final docRef = firestore.collection('category').doc(id);
    Category category = Category(
        id: docRef.id,
        name: name,
        parentId: '3Bwmo6yiWqZ1UDDkgJno',
        status: true);
    await docRef
        .set(category.toJson())
        .whenComplete(() => snackbar(
            title: 'تم',
            message: 'لقد تم تعديل القسم بنجاح',
            color: Colors.green))
        .catchError((error) {
      snackbar(title: 'خطاء', message: 'لقد حدث خطاء ', color: Colors.red);
    });
    _isLoaded = true;
  }

  /// Update sectioin status///
  void updateSectionStatus({required Category category}) async {
    _isLoaded = false;
    final docRef = firestore.collection('category').doc(category.id);
    await docRef
        .set(category.toJson())
        .whenComplete(() => snackbar(
            title: 'تم',
            message: 'لقد تم تعديل حاله القسم بنجاح',
            color: Colors.green))
        .catchError((error) {
      snackbar(title: 'خطاء', message: 'لقد حدث خطاء ', color: Colors.red);
    });
    _isLoaded = true;
  }
  ///////////////////////////////////////////////////
  ////////////// End Admin Side Function ///////////
  ///////////////////////////////////////////////////

  ///////////////////////////////////////////////////
  ////////////Start User Side Function //////////////
  ///////////////////////////////////////////////////


////// sections //////
// get sections documents //
  Future<void> getSectionDocuments() async {
    _isLoaded = false;
    final querySnapshot = await firestore
        .collection('category')
        .where('parentId', isEqualTo: '3Bwmo6yiWqZ1UDDkgJno')
        .where('status', isEqualTo: true)
        .get();
    _sections = [];
    documents = querySnapshot.docs;
    documents.forEach((element) {
      _sections.add(Category.fromJson(element.data()!));
    });
    _isLoaded = true;
  }

  // get section documents //
  Future<void> getSectionDocument({id}) async {
    _isLoaded = true;
    final querySnapshot =
        await firestore.collection('category').where('id', isEqualTo: id).get();
    _section = [];
    documents = querySnapshot.docs;
    documents.forEach((element) {
      _section.add(Category.fromJson(element.data()!));
    });
    _isLoaded = false;
  }


 Future<void> getCategoriesDocuments() async {
    _isLoaded = false;
    final querySnapshot = await firestore
        .collection('category')
        .where('parentId', isEqualTo: '3Bwmo6yiWqZ1UDDkgJno')
        .where('status', isEqualTo: true)
        .get();
    _categories = [];
    documents = querySnapshot.docs;
    documents.forEach((element) {
      _categories.add(Category.fromJson(element.data()!));
    });
    _isLoaded = true;
  }

  // get category document //
  Future<void> getCategoryDocument({id}) async {
    _isLoaded = true;
    final querySnapshot =
        await firestore.collection('category').where('id', isEqualTo: id).get();
    _category = [];
    documents = querySnapshot.docs;
    documents.forEach((element) {
      _category.add(Category.fromJson(element.data()!));
    });
    _isLoaded = false;
  }

  ///////////////////////////////////////////////////
  ////////////End User Side Function //////////////
  ///////////////////////////////////////////////////
  


  snackbar({required title, required message, required color}) {
    return Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.grey,
        colorText: color);
  }
}
