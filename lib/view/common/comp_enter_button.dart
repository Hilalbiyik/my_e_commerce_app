import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CompButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed; // onPressed'ı opsiyonel hale getirin
  const CompButton({Key? key, required this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 1900),
      child: GestureDetector(
        onTap: onPressed, // Eklenen satır: onPressed fonksiyonunu GestureDetector ile bağlayın
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(143, 148, 251, 1),
                Color.fromRGBO(143, 148, 251, .6),
              ],
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
