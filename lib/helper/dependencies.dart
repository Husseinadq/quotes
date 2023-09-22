import 'package:get/get.dart';
import 'package:quotes/controller/category_controller.dart';


Future<void> init() async {
//controllers
  Get.lazyPut(() => CategoryController());
}
