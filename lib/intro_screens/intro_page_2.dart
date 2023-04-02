import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ekran=MediaQuery.of(context);
    var yukseklik=ekran.size.height;
    var genislik=ekran.size.width;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(5),
        width: genislik,
        height: yukseklik,
        child: Image(
          image: AssetImage('assets/görsel3.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
