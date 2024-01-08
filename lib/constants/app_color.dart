import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.purple,
      primary: const Color(0xFF9833FF),
      secondary: const Color(0xFF00D29B),
      background: const Color(0xFFFFFFFF));
  static final Color textColor = Color(0xFF222222);
  static final Color textColorDark = Color(0xFFFFFFFF);
  static final Color boxColor = Color(0xFF0E0B93);
  static final Color favoriteButtonColor = Color(0xFFFE4657);
  static final Color backgroundDark = Color(0xFF333333);

  static poppinsTextTheme() {}
}

class ConstantsColor {
  static const bottomNavColor = Color(0xff1f2847);
  static const bodyColor = const Color(0xffd9f0fd);

  static const lightGreyColor = const Color(0xfff5f5f5);

  static const purpleColor = const Color(0xffb293ed);
  static const lightPurpleColor = const Color(0xffe1d7fc);
  static const greenColor = const Color(0xffe5fbec);
  static const orangeColor = const Color(0xfffcf1d5);
  static const lightorangeColor = const Color(0xfffef9ef);

  static const pinkColor = const Color(0xffff0054);
  static const lightPinkColor = const Color(0xfffcebed);
  //static const redColor = const Color(0xffee6463);
  static const blueColor = const Color(0xff2477fd);
  static const lightblueColor = const Color(0xfff6fafd);
}

class ConstantsAdress {
// static const String splash_animation = 'assets/splash_animation.json';
static const String onBoardingjson = 'assets/onboarding.json';
static const String onBoarding = 'assets/images/onBoarding_1.jpg';
static const String animation = "assets/animation.json";
static const String ProductTitle = "Product";
static const String LoginTitle = "Login";
static const String EnterEmail = "Email or Phone number";
static const String enterEmail = "Enter your email";
static const String password = "Password";
static const String bgPath = "assets/images/background.png";
static const String account = "Don't have an account? Create an account";
static const String ProductDetailTitle = "Product Detail";
static const String forgotPassword = "Forgot Password?";


}

TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.outfit(
      fontSize: 107, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.outfit(
      fontSize: 67, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.outfit(fontSize: 54, fontWeight: FontWeight.bold),
  headline4: GoogleFonts.outfit(
      fontSize: 38, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.outfit(fontSize: 27, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.outfit(
      fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.outfit(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.outfit(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.outfit(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.outfit(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.outfit(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.outfit(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.outfit(
      fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
