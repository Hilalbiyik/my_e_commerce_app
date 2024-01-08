import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/view/login_page.dart';
import 'package:my_e_commerce_app/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class OnBoardingViewModel with ChangeNotifier {
  late PageController pageController;
  int pageIndex = 0;
  int selectedPageIndex = 0; // Eklenen satır

  OnBoardingViewModel() {
    getPage();
  }

  void getPage() {
    pageController = PageController(initialPage: 0);
    notifyListeners();
  }

  // Diğer metodlar ve kodlar

  // Yeni metod: Seçilen sayfa indeksini güncelle
  void updateSelectedPageIndex(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }

   void openLoginPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: LoginPage(),
      ),
    );
    Navigator.pushReplacement(context, pageRoute);
  }




}

