import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'home_screen.dart';
void main()=>runApp( Calculator());
class Calculator extends StatelessWidget {
  //const Calculator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(
        backgroundColor: Colors.white,
        imageSrc: 'assets/calculator1.jpg',
        imageSize: 350,


        duration: 7070,
        navigateRoute: HomeScreen(),
      ),
    );
  }
}
