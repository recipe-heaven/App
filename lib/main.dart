import 'package:App/pages/home/home.dart';

import 'package:App/routes/router.dart';
import 'package:flutter/material.dart';

import 'designstuff/themes.dart' as app_themes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: app_themes.mainTheme.copyWith(), //ThemeData.dark(),
        // initialRoute: RouteHome,
        home: Home(),
        onGenerateRoute: (settings) => router(context, settings));
  }
}

class Path404Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("ERROR SIDE NOT FOUND"
          "/side note burde kansje ha en vei ut av skjermen her"),
    );
  }
}
