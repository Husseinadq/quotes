import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quotes/app/color.dart';
import 'package:quotes/model/quote.dart';

class QuoteController extends GetxController {

  final firestore = FirebaseFirestore.instance;
// admin var
 List<Quote> _allAdminQuotes=[];
 Quote ?_adminQuote;

 List<Quote> get getAllAdminQoutes=>_allAdminQuotes;
 Quote get getAdminQoute=>_adminQuote!;


// user var
final List<Quote> _allQuotes=[];
 Quote ?_quote;
 List<Quote> get getAllQoutes=>_allQuotes;
 Quote get getQoute=>_quote!;




 //////// Admin side /////////////////
 
 // get category documents //
  Future<void> getQoutesForAdmin() async {
    final querySnapshot = await firestore
        .collection('quotes')
        .orderBy('createdAt', descending: true)
      .limit(20)
      .get();
    _allAdminQuotes = [];
    print("quotes docs = ${querySnapshot.docs.length}");
    print("quotes docs = ${querySnapshot.docs}");
    for (var quote in querySnapshot.docs) {
       print("quotes docs = ${quote.data()}");
      _allAdminQuotes.add(Quote.fromJson(quote.data()));
      print("quotes docs = ${_allAdminQuotes[0]}");
    }
    print("quotes = $_allAdminQuotes");
   
  }













 ///////////// User side  //////////////////
 
// create sections documents //
  void createQuote({required Quote quote}) async {
  
    final docRef = firestore.collection('quotes').doc();
   quote.id=docRef.id;
    await docRef
        .set(quote.toJson())
        .whenComplete(() => snackbar(
            title: 'تم',
            message: 'لقد تم اضافة الاقتباس بنجاح',
            color: AppColors.primary))
        .catchError((error) {
      snackbar(title: 'خطاء', message: 'لقد حدث خطاء ', color: AppColors.primary);
    });
  }

  // create sections documents //
  void updateQuote({required Quote quote}) async {
  
    final docRef = firestore.collection('quotes').doc(quote.id);
   
    await docRef
        .set(quote.toJson())
        .whenComplete(() => snackbar(
            title: 'تم',
            message: 'لقد تم تعديل الاقتباس بنجاح',
            color: AppColors.primary))
        .catchError((error) {
      snackbar(title: 'خطاء', message: 'لقد حدث خطاء ', color: AppColors.primary);
    });
  }

    /// Update sectioin status///
  void updateQuoteStatus({required Quote quote}) async {
    final docRef = firestore.collection('quotes').doc(quote.id);
    await docRef
        .set(quote.toJson())
        .whenComplete(() => snackbar(
            title: 'تم',
            message: 'لقد تم تعديل  حالة الاقتباس بنجاح',
            color: AppColors.primary))
        .catchError((error) {
      snackbar(title: 'خطاء', message: 'لقد حدث خطاء ', color: AppColors.primary);
    });
  }







 snackbar({required title, required message, required color}) {
    return Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.secondry,
        colorText: color);
  }
}