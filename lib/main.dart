import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quotes/firebase_options.dart';
import 'package:quotes/view/splash_screen.dart';
import 'package:quotes/view/start_screen.dart';
import 'helper/dependencies.dart' as dep;

Future main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await dep.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Directionality(textDirection: TextDirection.rtl,child: SplashScreen()),
      
    );
  }
}
