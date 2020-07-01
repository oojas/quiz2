import 'package:flutter/material.dart';
import 'package:quiz/UI/quiz.dart';
final ThemeData _apptheme= _buildappTHeme();

ThemeData _buildappTHeme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      brightness: Brightness.dark,
      primaryColor: Colors.brown,
      accentColor: Colors.deepOrangeAccent,
      scaffoldBackgroundColor: Colors.blue,
      backgroundColor: Colors.blue,
      textTheme: _apptexttheme(base.textTheme),



  );


}
  TextTheme _apptexttheme(TextTheme base){
    return base.copyWith(
      button: base.button.copyWith(
        letterSpacing: 3.0
      ),
      body1: base.bodyText1.copyWith(
        fontFamily: ("ChelseaMarket")
      )


    );
  }




void main() {
  runApp(new MaterialApp(
    theme: _apptheme,

    home: pok(),
  ));
}


