import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/model/product.dart';
import 'package:my_e_commerce_app/view/add_product_page.dart';
import 'package:my_e_commerce_app/view_model/add_product_view_model.dart';
import 'package:provider/provider.dart';

class MainViewModel with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Product> _products = [];


  List<Product> get products  => _products;

  MainViewModel(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getProducts();
    });
  }

  void _getProducts() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("products").get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
        in snapshot.docs) {
      Product product = Product.fromMap(
        documentSnapshot.id,
        documentSnapshot.data(),
      );
      _products.add(product);
    }
    notifyListeners();
  }

  void openAddProductPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => AddProductViewModel(),
        child: AddProductPage(),
      ),
    );
    Navigator.push(context, pageRoute).then((value){
      _products.clear();
      _getProducts();
    });
  }
}
