import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/model/product.dart';

class AddProductViewModel with ChangeNotifier{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addProduct(BuildContext context, String name,String content ,String price) async {
    Product product = Product(name,content,price);
    await _firestore.collection("products").doc().set(product.toMap());
    Navigator.pop(context);
  }
}