
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/view/main_page.dart';
import 'package:my_e_commerce_app/view/register_page.dart';
import 'package:my_e_commerce_app/view_model/main_view_model.dart';
import 'package:my_e_commerce_app/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

class LoginViewModel with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  void login(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(_auth.currentUser != null);
      _showSnackbar(context, "Login successfull");
      _openMainPage(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void forgotPassword(BuildContext context) async {
    await _auth.signOut();
    _auth.sendPasswordResetEmail(email: "hilalbyk396@gmail.com");
  }

  void openRegisterPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => RegisterViewModel(),
        child: RegisterPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }

  void _openMainPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => MainViewModel(),
        child: MainPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }

   void _showSnackbar(BuildContext context, String message) {
    //Snackbar nesnesi ürettik
    SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    print(message);
  }
}
