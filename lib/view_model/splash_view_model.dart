import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/view/main_page.dart';
import 'package:my_e_commerce_app/view/on_Boarding_page.dart';
import 'package:my_e_commerce_app/view_model/main_view_model.dart';
import 'package:my_e_commerce_app/view_model/on_boarding_view_model.dart';
import 'package:provider/provider.dart';


class SplashViewModel with ChangeNotifier {
  void getSplash(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (BuildContext context) => MainViewModel(),
              child: MainPage(),
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (BuildContext context) => OnBoardingViewModel(),
              child: OnBoardingPage(),
            ),
          ),
        );
      }
    });
  }
}
