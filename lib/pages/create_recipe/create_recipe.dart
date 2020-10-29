import 'dart:ui';

import 'package:App/components/form/form_validators.dart';
import 'package:App/components/navigation/bottom_navigation.dart';
import 'package:App/data_classes/course.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/pages/common_widgets/input_feald.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewCoursePage extends StatefulWidget {
  @override
  NewCoursePageState createState() => NewCoursePageState();
  final Recipe _course = Recipe();
}

class NewCoursePageState extends State<NewCoursePage> {
  final _formKey = GlobalKey<FormState>();
  void _handleSaveMeal() {
    if (_formKey.currentState.validate()) {
      final FormState formS = _formKey.currentState;
      formS.save();

      print("name: " + widget._course.name);
      print("des: " + widget._course.description);
      print("type: " + widget._course.type);
      print("steps: " + widget._course.cookingSteps.toString());
      print("ingr: " + widget._course.ingredients.toString());
      print("tags: " + widget._course.tags.toString());
      print("time: " + widget._course.cookTime.toString());
      print("name: " + widget._course.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBar(context, (isNavigating) {}),
      body: ListView(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera),
                          Text(
                            "ADD PHOTO",
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
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
                        label: "Meal Name",
                        onSave: (newValue) => {widget._course.name = newValue},
                        validator: validateNotEmptyInput,
                        initVal: widget._course.name,
                        hint: "name"),
                    newMealInputBox(context,
                        label: "Tags",
                        onSave: (newValue) => {
                              if (newValue.length > 2)
                                {
                                  widget._course.tags = newValue
                                      .split(" ")
                                      .map((e) => Tag(e.replaceFirst("#", "")))
                                }
                            },
                        validator: validateTagFeald,
                        initVal: _getTagString(),
                        hint: "tags"),
                    newMealInputBox(context,
                        label: "Description",
                        onSave: (newValue) =>
                            {widget._course.description = newValue},
                        validator: validateNotEmptyInput,
                        initVal: widget._course.name,
                        hint: "desc"),
                    newTimeInputBox(context,
                        hedValue: "Estimated time",
                        onSaveHour: (newValue) =>
                            {widget._course.cookTime = num.parse(newValue)},
                        onSaveMin: (newValue) =>
                            {widget._course.cookTime = num.parse(newValue)},
                        validator: validateFloatInput),
                    Row(
                      children: [
                        Text(
                          "Ingredients",
                          style: Theme.of(context).accentTextTheme.headline2,
                        ),
                        Spacer()
                      ],
                    ),
                    Column(
                      children: [
                        for (Ingredient ing in widget._course.ingredients)
                          Container(
                            child: newMealIngredientInputBlock(
                              context,
                              ingredient: ing,
                              onSavedAmmount: (newValue) => {
                                widget
                                    ._course
                                    .ingredients[(widget._course.ingredients
                                        .indexOf(ing))]
                                    .amount = 1
                              }, // TODO: actually save ammount
                              onSavedType: (newValue) =>
                                  {ing.unitType = newValue},
                              onSavedComment: (newValue) {
                                ing.comment = newValue;
                              },
                              onPressdBack: () {
                                setState(() {
                                  widget._course.ingredients.remove(ing);
                                });
                              },
                              validator: null,
                              onDropdownChanged: (value) {
                                setState(() {
                                  print(value);
                                  ing.unitType = value;
                                });
                              },
                            ),
                            key: ing.key,
                          ),
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              widget._course.ingredients.add(Ingredient());
                            });
                          },
                          elevation: 2.0,
                          fillColor: elementBackgroundColor,
                          child: Icon(Icons.add),
                          padding: EdgeInsets.all(5.0),
                          shape: CircleBorder(),
                        ),
                        Text("Add another",
                            style: Theme.of(context).textTheme.headline4)
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Steps",
                          style: Theme.of(context).accentTextTheme.headline2,
                        ),
                        Spacer()
                      ],
                    ),
                    Column(
                      children: [
                        for (MapEntry<int, RecipeStep> entry
                            in widget._course.cookingSteps.asMap().entries)
                          Container(
                            child: newMealStepInputBlock(
                              context,
                              first: entry.key == 0,
                              last: entry.key ==
                                  widget._course.cookingSteps.length - 1,
                              hint: "step",
                              step: entry.value,
                              onSavedStepp: (newValue) {
                                entry.value.step = newValue;
                              },
                              hedValue: "Estimated time",
                              onPressdDown: () {
                                setState(() {
                                  widget._course.cookingSteps
                                      .removeAt(entry.key);
                                  widget._course.cookingSteps
                                      .insert(entry.key + 1, entry.value);
                                });
                              },
                              onPressdUp: () {
                                setState(() {
                                  widget._course.cookingSteps
                                      .removeAt(entry.key);
                                  widget._course.cookingSteps
                                      .insert(entry.key - 1, entry.value);
                                });
                              },
                              onPressdBack: () {
                                setState(() {
                                  widget._course.cookingSteps
                                      .remove(entry.value);

                                  //widget._course.cookingSteps.removeAt(widget._course.cookingSteps.indexOf(step));
                                });
                              },
                              validator: null,
                            ),
                            key: entry.value.key,
                          ),
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              widget._course.cookingSteps.add(RecipeStep());
                            });
                          },
                          elevation: 2.0,
                          fillColor: elementBackgroundColor,
                          child: Icon(Icons.add),
                          padding: EdgeInsets.all(5.0),
                          shape: CircleBorder(),
                        ),
                        Text("Add another",
                            style: Theme.of(context).textTheme.headline4)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RawMaterialButton(
                      onPressed: _handleSaveMeal,
                      elevation: 2.0,
                      fillColor: Theme.of(context).buttonColor,
                      child: Text(
                        "SAVE",
                        style: Theme.of(context).accentTextTheme.headline3,
                      ),
                      padding: EdgeInsets.all(25.0),
                      shape: CircleBorder(),
                    )
                  ],
                )),
            padding: const EdgeInsets.all(10),
          )
        ],
      ),
    );
  }

  String _getTagString() {
    if (widget._course.tags.length == 0) {
      return "";
    } else {
      return widget._course.tags
          .map((e) => e.tagName)
          .reduce((value, element) => value + " " + element);
    }
  }
}

/*

Validering pa estimated time viser bare e... < tror vi bare fjerner feedback melding og bare har rod border pa den

Dropdown for ingredients er større en andre felt

Hint fargen er off
- eneste rødfargen i palleten

Hint text mangler eller er ikke hints> tags.. -> #dessert #lowfat eks


input_feald filen har mye duplication


 */
