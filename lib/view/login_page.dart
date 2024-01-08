import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/constants/app_color.dart';
import 'package:my_e_commerce_app/view/common/comp_enter_button.dart';
import 'package:my_e_commerce_app/view/common/comp_header.dart';
import 'package:my_e_commerce_app/view/common/comp_text_field.dart';
import 'package:my_e_commerce_app/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ConstantsAdress.bgPath),
                          fit: BoxFit.fill)),
                  child: CompHeader(title: ConstantsAdress.LoginTitle,)
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeInUp(
                          duration: Duration(milliseconds: 1800),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                CompTextField(
                                  controller: _emailController,
                                  hintText: ConstantsAdress.enterEmail,
                                  obscureText: false,
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      width:
                                          2.0), 
                                ),
                                CompTextField(
                                  controller: _passwordController,
                                  hintText: ConstantsAdress.password,
                                  obscureText: true,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      buildLoginButton(context),
                      SizedBox(
                        height: 70,
                      ),
                      buildForgotPassword(context),
                      _buildOpenRegisterButton(context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

Widget buildLoginButton(BuildContext context){
  LoginViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    
  return CompButton(
    title: ConstantsAdress.LoginTitle, onPressed: (){
       viewModel.login(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
    },);
}


Widget buildForgotPassword(BuildContext context){
  LoginViewModel viewModel = Provider.of(
    context,
    listen: false,
  );
  return FadeInUp(
    duration: Duration(milliseconds: 2000),
    child: GestureDetector(
      onTap: () {
viewModel.forgotPassword(context);

      },
      child: Text(
        ConstantsAdress.forgotPassword,
        style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
      ),
    ),
  );
}



  Container buildEmailTextField() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(143, 148, 251, 1)))),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: ConstantsAdress.EnterEmail,
            hintStyle: TextStyle(color: Colors.grey[700])),
      ),
    );
  }
  Widget _buildOpenRegisterButton(BuildContext context) {
    LoginViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return FadeInUp(
      duration: Duration(milliseconds: 2000),
      child: TextButton(
        child: Text(ConstantsAdress.account,
        style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
        
        )
        ,
        onPressed: () {
          viewModel.openRegisterPage(context);
        },
      ),
    );
  }
}
