import 'dart:ui';

import 'package:App/components/navigation/bottom_navigation.dart';
import 'package:App/data_classes/course.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/pages/cards/input_feald.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewCoursePage extends StatelessWidget {
  final Recipe _course = Recipe();

  final _formKey = GlobalKey<FormState>();

  NewCoursePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBar(context, (isNavigating) {}),
      body: Column(
        children: [
          FlatButton(
            minWidth: double.infinity,
            onPressed: null,
            child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                      begin: Alignment(0.0, 0.0),
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).scaffoldBackgroundColor,
                        Colors.transparent
                      ]).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              ExactAssetImage("assets/images/y_6cfb1008.jpg"),
                          fit: BoxFit.cover)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(0.0)),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      child: Column(
                        children: [Icon(Icons.camera), Text("Add Photo")],
                      ),
                    ),
                  ),
                )),
            padding: const EdgeInsets.all(0),
          ),
          Text(
            "NEW RECIPE",
            style: Theme.of(context).accentTextTheme.headline1,
          ),
          Container(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    newMealInputBox(context,
                        hedValue: "Meal Name",
                        onSave: (newValue) => {_course.name = newValue},
                        validator: null,
                        hint: "name"),
                    newMealInputBox(context,
                        hedValue: "Tags",
                        onSave: (newValue) => {_course.name = newValue},
                        validator: null,
                        hint: "tags"),
                    newMealInputBox(context,
                        hedValue: "Description",
                        onSave: (newValue) => {_course.name = newValue},
                        validator: null,
                        hint: "desc"),
                  ],
                )),
            padding: const EdgeInsets.all(10),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
