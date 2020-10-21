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

var alpha = Color(0xffff0099);
var beta = Color(0xff00cc0c);
var charly = Color(0xff000099);
var echo = Color(0xff000000);
var foxtrot = Color(0xffff0099);

var font_1 = "Playfair_Display";

ThemeData mainTheme = ThemeData(
    bottomAppBarColor: Colors.deepOrange,
    accentColor: beta,
    primarySwatch: Colors.blue,
    fontFamily: "Roboto",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        headline1: TextStyle(fontFamily: font_1, color: alpha, fontSize: 50),
        headline2: TextStyle(fontFamily: font_1, color: alpha, fontSize: 20),
        headline6: TextStyle(fontSize: 12, color: beta),
        bodyText1: TextStyle(fontStyle: FontStyle.italic),
        bodyText2: TextStyle(
            fontFamily: font_1, fontWeight: FontWeight.w500, fontSize: 17),
        headline4: TextStyle(
            fontFamily: "Roboto", color: Colors.black54, fontSize: 15),
        headline5:
            TextStyle(fontFamily: "Lobster", color: echo, fontSize: 50)));
