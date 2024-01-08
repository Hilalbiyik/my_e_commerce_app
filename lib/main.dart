import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/firebase_options.dart';
import 'package:my_e_commerce_app/view/add_product_page.dart';
import 'package:my_e_commerce_app/view/main_page.dart';
import 'package:my_e_commerce_app/view/splash_page.dart';
import 'package:my_e_commerce_app/view_model/add_product_view_model.dart';
import 'package:my_e_commerce_app/view_model/main_view_model.dart';
import 'package:my_e_commerce_app/view_model/splash_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (BuildContext context) =>SplashViewModel(),
        child: SplashPage(),
      ),
    );
  }
}

