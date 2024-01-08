import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/view/common/comp_enter_button.dart';
import 'package:my_e_commerce_app/view/common/comp_text_field.dart';
import 'package:my_e_commerce_app/view_model/add_product_view_model.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
   TextEditingController _priceController = TextEditingController();

  AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            FadeInUp(
                duration: Duration(milliseconds: 1800),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Color.fromRGBO(143, 148, 251, 1)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: <Widget>[
                      CompTextField(
                        controller: _nameController,
                        hintText: 'Product Name',
                        borderSide: BorderSide(
                            color: Color.fromRGBO(143, 148, 251, 1),
                            width: 2.0),
                      ),
                      CompTextField(
                        controller: _contentController,
                        hintText: 'Product Content',
                        borderSide: BorderSide(
                            color: Color.fromRGBO(143, 148, 251, 1),
                            width: 2.0),
                      ),
                      CompTextField(
                        controller: _priceController,
                        hintText: 'Product Price',
                      ),
                      
                    ],
                  ),
                )),
            SizedBox(
              height: 100,
            ),
            buildAddProductButton(context),
            SizedBox(
              height: 70,
            ),
          ],
        ),
        
      ),
    );
  }

  Widget buildAddProductButton(BuildContext context) {
    AddProductViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return CompButton(
      onPressed: () {
        viewModel.addProduct(
          context,
          _nameController.text.trim(),
          _contentController.text.trim(),
          _priceController.text.trim()
          
        );
      },
      title: 'Add Product',
    );
  }
}