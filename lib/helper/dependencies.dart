import 'package:get/get.dart';
import 'package:quotes/controller/category_controller.dart';
import 'package:quotes/controller/quote_controller.dart';


Future<void> init() async {
//controllers
  Get.lazyPut(() => CategoryController());
  Get.lazyPut(() => QuoteController());
}
