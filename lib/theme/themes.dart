import 'package:flutter/material.dart';

final formTextColor = Color(0xFF555555);
final formHintColor = Color(0xFFCCCCCC);
final errorColor = Color(0xFFD96060);
final acceptColor = Color(0xFF4F6E81);
final softTextColor = Color(0xFFD5E2E6);
final fadeTextColor = Color(0xFF687A89);
final mainBackgroundColor = Color(0xFF161D21);
final elementBackgroundColor = Color(0xFF222D33);
final linkActiveColor = Color(0xFFFFC891);
final splitLineColor = Color(0xFF304048);

final navBarBackgroundColor = Color(0xFF222D33);
final shadowColor = Color(0xCC111D22);

final playfairFont = "Playfair_Display";
final robotoFont = "Roboto";
final lobsterFont = "Lobster";

final mainTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: navBarBackgroundColor,
        selectedIconTheme: IconThemeData(
          color: linkActiveColor,
        ),
        selectedLabelStyle: TextStyle(
          color: linkActiveColor,
        ),
        selectedItemColor: linkActiveColor,
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
    accentColor: Colors.red,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontFamily: lobsterFont, color: softTextColor, fontSize: 50),
    ),
    accentTextTheme: TextTheme(
      headline1: TextStyle(
          fontFamily: playfairFont, color: softTextColor, fontSize: 50),
      headline2: TextStyle(
          fontFamily: playfairFont, color: softTextColor, fontSize: 30),
      headline3: TextStyle(
          fontFamily: playfairFont, color: softTextColor, fontSize: 20),
      headline4: TextStyle(
          fontFamily: playfairFont, color: softTextColor, fontSize: 20),
      caption: TextStyle(
          fontFamily: playfairFont, color: softTextColor, fontSize: 10),
    ),
    primaryTextTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: robotoFont, color: softTextColor, fontSize: 50),
        headline2: TextStyle(
            fontFamily: robotoFont, color: softTextColor, fontSize: 20),
        headline3: TextStyle(fontFamily: robotoFont, color: softTextColor),
        headline4: TextStyle(
            fontFamily: robotoFont,
            color: splitLineColor,
            fontStyle: FontStyle.italic,
            fontSize: 12),
        headline6: TextStyle(fontFamily: robotoFont, color: softTextColor),
        bodyText1: TextStyle(fontStyle: FontStyle.italic),
        bodyText2: TextStyle(
            fontFamily: playfairFont,
            fontWeight: FontWeight.w500,
            fontSize: 17),
        headline5:
            TextStyle(fontFamily: "Lobster", color: Colors.red, fontSize: 50)));
/*

Theme.of(context).textTheme.headline4


 */
