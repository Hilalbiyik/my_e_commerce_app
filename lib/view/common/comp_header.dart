import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CompHeader extends StatelessWidget {
  final String title;
  
  const CompHeader({
    super.key, required this.title
  });
  @override
  Widget build(BuildContext context) {
  return Stack(
      children: [
        Positioned(
          left: 30,
          width: 80,
          height: 200,
          child: FadeInUp(
              duration: Duration(seconds: 1),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/light-1.png'))),
              )),
        ),
        Positioned(
          left: 140,
          width: 80,
          height: 150,
          child: FadeInUp(
              duration: Duration(milliseconds: 1200),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/light-2.png'))),
              )),
        ),
        Positioned(
          right: 40,
          top: 40,
          width: 80,
          height: 150,
          child: FadeInUp(
              duration: Duration(milliseconds: 1300),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/clock.png'))),
              )),
        ),
        Positioned(
          child: FadeInUp(
              duration: Duration(milliseconds: 1600),
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        )
      ],
    );
  }

  }
