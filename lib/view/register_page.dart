import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/view/common/common_text_field.dart';
import 'package:my_e_commerce_app/view/common/comp_enter_button.dart';
import 'package:my_e_commerce_app/view/common/comp_header.dart';
import 'package:my_e_commerce_app/view/common/comp_text_field.dart';
import 'package:my_e_commerce_app/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  RegisterPage({super.key});

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
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: CompHeader(title: "Register"),
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
                                  hintText: 'Enter your email',
                                  obscureText: false,
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      width: 2.0),
                                ),
                                CompTextField(
                                  controller: _passwordController,
                                  hintText: 'Password',
                                  obscureText: true,
                                ),

                                // buildEmailTextField(),
                                // buildPasswordTextField()
                              ],
                            ),
                          )),

                      SizedBox(
                        height: 30,
                      ),
                      _buildRegisterButton(context),
                      //buildLoginButton(),
                      SizedBox(
                        height: 70,
                      ),
                      _buildOpenRegisterButton(context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildLoginButton(BuildContext context) {
    RegisterViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
      child: Text("Kayıt Ol"),
      onPressed: () {
        viewModel.register(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
      },
    );
  }

  Widget _buildOpenRegisterButton(BuildContext context) {
    RegisterViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return TextButton(
      child: Text(
        "Hesabınız var mı? Giriş yapın",
        style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
      ),
      onPressed: () {
        viewModel.openLoginPage(context);
      },
    );
  }
  Widget _buildRegisterButton(BuildContext context) {
  RegisterViewModel viewModel = Provider.of(
    context,
    listen: false,
  );
  return CompButton(
    title: "Register",
    onPressed: () {
      viewModel.register(
        context,
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    },
  );
}

}

