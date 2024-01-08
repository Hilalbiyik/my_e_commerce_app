import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/constants/app_color.dart';
import 'package:my_e_commerce_app/model/product.dart';
import 'package:my_e_commerce_app/view/detail_page.dart';
import 'package:my_e_commerce_app/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainViewModel viewModel = Provider.of<MainViewModel>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstantsAdress.ProductTitle),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          viewModel.openAddProductPage(context);
        },
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, child) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: viewModel.products.length,
        itemBuilder: (BuildContext context, int index) {
           Product product = viewModel.products[index];
          return GestureDetector(
            onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailPage(product)));
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: ConstantsColor.lightGreyColor,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ConstantsAdress.onBoarding,width: 120,),
                      Text(viewModel.products[index].name),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              viewModel.products[index].price,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.favorite,
                              color: ConstantsColor.pinkColor,
                            )
                          ],
                        ),
                      )
                      //Text(viewModel.products[index].content),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


 

}
