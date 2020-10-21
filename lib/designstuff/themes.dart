import 'package:flutter/material.dart';

var formTextColor = Color(0xFF555555);
var formHintColor = Color(0xFFCCCCCC);
var errorColor = Color(0xFFD96060);
var acceptColor = Color(0xFF4F6E81);
var softTextColor = Color(0xFFD5E2E6);
var fadeTextColor = Color(0xFF687A89);
var mainBackgroundColor = Color(0xFF161D21);
var elementBackgroundColor = Color(0xFF222D33);
var linkActiveColor = Color(0xFFFFC891);
var splitLineColor = Color(0xFF304048);

var navBarBackgroundColor = Color(0xFF222D33);
var shadowColor = Color(0xFF000000);

var alpha = Color(0xffff0099);
var beta = Color(0xff00cc0c);
var charly = Color(0xff000099);
var echo = Color(0xff000000);
var foxtrot = Color(0xffff0099);

var font_1 = "Playfair_Display";
var font_2 = "Roboto";
var font_3 = "Lobster";

final mainTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: navBarBackgroundColor,
        selectedIconTheme: IconThemeData(
          color: linkActiveColor,
        ),
        selectedLabelStyle: TextStyle(
          color: linkActiveColor,
        ),
        unselectedIconTheme: IconThemeData(
          color: softTextColor,
        ),
        unselectedLabelStyle: TextStyle(
          color: softTextColor,
        )),
    shadowColor: shadowColor,
    dialogBackgroundColor: elementBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: const EdgeInsets.all(10),
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0), // dobbel defined also in input_fealds
          ),
        ),
        hintStyle: TextStyle(
          color: formHintColor,
        )),
    backgroundColor: mainBackgroundColor,
    scaffoldBackgroundColor: mainBackgroundColor,
    iconTheme: IconThemeData(color: fadeTextColor),

    //bottomAppBarColor: Colors.deepOrange,
    accentColor: beta,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headline1:
          TextStyle(fontFamily: font_3, color: softTextColor, fontSize: 50),
    ),
    accentTextTheme: TextTheme(
      headline1:
          TextStyle(fontFamily: font_1, color: softTextColor, fontSize: 50),
      headline2:
          TextStyle(fontFamily: font_1, color: softTextColor, fontSize: 30),
      headline3:
          TextStyle(fontFamily: font_1, color: softTextColor, fontSize: 20),
      headline4:
          TextStyle(fontFamily: font_1, color: softTextColor, fontSize: 20),
      caption:
          TextStyle(fontFamily: font_1, color: softTextColor, fontSize: 10),
    ),
    primaryTextTheme: TextTheme(
        headline1:
            TextStyle(fontFamily: font_2, color: softTextColor, fontSize: 50),
        headline2:
            TextStyle(fontFamily: font_2, color: softTextColor, fontSize: 20),
        headline3: TextStyle(fontFamily: font_2, color: softTextColor),
        headline4: TextStyle(
            fontFamily: font_2,
            color: splitLineColor,
            fontStyle: FontStyle.italic,
            fontSize: 12),
        headline6: TextStyle(fontFamily: font_2, color: softTextColor),
        bodyText1: TextStyle(fontStyle: FontStyle.italic),
        bodyText2: TextStyle(
            fontFamily: font_1, fontWeight: FontWeight.w500, fontSize: 17),
        headline5:
            TextStyle(fontFamily: "Lobster", color: echo, fontSize: 50)));
/*

Theme.of(context).textTheme.headline4


 */
