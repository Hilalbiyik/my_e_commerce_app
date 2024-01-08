import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/constants/app_color.dart';
import 'package:my_e_commerce_app/model/product.dart';

class DetailPage extends StatelessWidget {
  Product product;
  DetailPage(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: ConstantsColor.lightPurpleColor,
        appBar: AppBar(
          backgroundColor: ConstantsColor.purpleColor,
          title: Text(
            ConstantsAdress.ProductDetailTitle,
            style: TextStyle(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              height: screenHeight * 0.60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  30
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(ConstantsAdress.onBoarding,width: 200,),
                    Text(
                      product.name,
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold ),
                    ),
                    Text(
                      product.content,
                      style: TextStyle(fontSize: 25),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(
                        product.price,
                        style: TextStyle(fontSize: 25),
                      ),Icon(
                        Icons.favorite,
                        color: ConstantsColor.pinkColor,
                      )


                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ));
    ;
  }
}
