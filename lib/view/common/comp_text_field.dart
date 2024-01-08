import 'package:flutter/material.dart';

class CompTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText; // obscureText'i opsiyonel hale getirin
  final BorderSide? borderSide; // BorderSide'ı opsiyonel hale getirin
  const CompTextField({Key? key, this.controller, this.hintText, this.obscureText = false, this.borderSide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: borderSide != null ? Border(bottom: borderSide!) : null,
      ),
      child: TextField(
        obscureText: obscureText, // obscureText özelliğini buradan alın
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[700]),
        ),
      ),
    );
  }
}
