import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String? id;
  String name;
  String content;
  String price;

  Product(this.name, this.content,this.price);

  Product.fromMap(this.id, Map<String, dynamic> map)
      :
      name = map["name"],
      content = map["content"],
      price = map["price"];

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "content": content,
      "price": price
    };
  }
}
