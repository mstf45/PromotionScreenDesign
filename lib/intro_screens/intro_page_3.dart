import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ekran=MediaQuery.of(context);
    var yukseklik=ekran.size.height;
    var genislik=ekran.size.width;
    return SafeArea(
      child: SizedBox(
        width: genislik,
        height: yukseklik,
        child: Image(
          image: AssetImage('assets/görsel2.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
