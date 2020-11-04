import 'dart:ui';

import 'package:App/components/form/form_validators.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/main.dart';
import 'package:App/pages/common_widgets/input_feald.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/meal_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CreateMealPage extends StatefulWidget {
  final authService = MealService(HttpClient());
  final _meal = TEST_DATA;
  final _isEditing = false;
  CreateMealPage({Key key}) : super(key: key);

  @override
  CreateMealPageState createState() => CreateMealPageState();
}

final _fadeToCollor = Colors.black; // Color(0xdd000000);

class CreateMealPageState extends State<CreateMealPage> {
  final _formKey = GlobalKey<FormState>();

  void _handleNewMeal() async {
    final FormState formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();

      var res = await widget.authService.addNewMeal(meal: widget._meal);
      if (res == null) {
        setState(() {});
      } else {
        // Do routing, set state
      }
    }
  }

  Future<void> _displayMakePublicDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.pink,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("WAAAAAAAAA"),
            actions: [
              FlatButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                      widget._meal.public = true;
                    });
                  },
                  child: Text("jup")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("nup"))
            ],
          );
        });
  }

  Widget _make_recipe_card(Recipe recipe) {
    return Container(
      height: 200,
      child: Card(
        color: _fadeToCollor,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                          begin: Alignment(-0.55, 0.0),
                          end: Alignment(-0.66, 1.3),
                          colors: [_fadeToCollor, Colors.transparent])
                      .createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  "assets/images/123.gif",
                  fit: BoxFit.fitWidth,
                )),
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: errorColor,
                      ),
                      onPressed: () {
                        setState(() {
                          widget._meal.recipe.remove(recipe);
                        });
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        recipe.name,
                        style: Theme.of(context).textTheme.headline3,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Recipe _ChristoffersMagicSearchAlgorithm() {
    return null;
  }

  Widget _category_selector(
      {String buttonText, VoidCallback onClick, String category}) {
    return Column(
      children: [
        Column(
          children: [
            for (Recipe mRecipe in widget._meal.recipe) ...[
              if (mRecipe.type == category) _make_recipe_card(mRecipe),
            ],
            MaterialButton(
              color: elementBackgroundColor, //Theme.of(context).buttonColor,
              minWidth: double.maxFinite,
              elevation: 10,
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.headline2,
              ),
              onPressed: onClick,
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(
                              "assets/images/BANNER-NEW-MEAL.png"),
                          fit: BoxFit.cover)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 10),
                        child: Text(
                          "Put together the",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Text(
                        "Pefect meal",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Spacer(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Form(
                          key: _formKey,
                          child: secondaryInputField(context,
                              label: "Meal title", onSave: (newValue) {
                            widget._meal.name = newValue;
                          },
                              validator: validateNotEmptyInput,
                              hint: "recipe@mail.com"),
                        ),
                        padding: const EdgeInsets.fromLTRB(0, 5, 30, 20),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
              alignment: Alignment.center,
              fit: StackFit.expand,
            ),
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          Container(
            height: 10,
            width: double.maxFinite,
            color: Theme.of(context).backgroundColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Meal is: ',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    if (!widget._meal.public) ...[
                      Text(
                        "PRIVATE",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: YeahhhhhColor),
                      ),
                      Spacer(),
                      MaterialButton(
                        child: Text("Make public"),
                        color: Theme.of(context).errorColor,
                        onPressed: () {
                          this._displayMakePublicDialog(context);
                        },
                        height: 20,
                      ),
                      Spacer(),
                    ],
                    if (widget._meal.public) ...[
                      Text(
                        "PUBLIC",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: errorColor),
                      ),
                      if (!widget._isEditing) ...[
                        Spacer(),
                        MaterialButton(
                          child: Text("Make private"),
                          color: YeahhhhhColor,
                          onPressed: () {
                            setState(() {
                              widget._meal.public = false;
                            });
                          },
                          height: 20,
                        ),
                        Spacer(),
                      ],
                    ],
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                _category_selector(
                  buttonText: "ADD STARTERS",
                  category: "starters",
                  onClick: () {
                    var newRecipe = this._ChristoffersMagicSearchAlgorithm();
                    if (newRecipe != null) {
                      widget._meal.recipe.add(newRecipe);
                    } else {
                      print("selected unit is null christoffer is to blame");
                    }
                  },
                ),
                _category_selector(
                  buttonText: "ADD COURSE",
                  category: "course",
                  onClick: () {
                    var newRecipe = this._ChristoffersMagicSearchAlgorithm();
                    if (newRecipe != null) {
                      widget._meal.recipe.add(newRecipe);
                    } else {
                      print("selected unit is null christoffer is to blame");
                    }
                  },
                ),
                _category_selector(
                  buttonText: "ADD DESSERT",
                  category: "dessert",
                  onClick: () {
                    var newRecipe = this._ChristoffersMagicSearchAlgorithm();
                    if (newRecipe != null) {
                      widget._meal.recipe.add(newRecipe);
                    } else {
                      print("selected unit is null christoffer is to blame");
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: MaterialButton(
                      onPressed: _handleNewMeal,
                      color: acceptColor,
                      minWidth: double.infinity,
                      child: Text(
                        "SAVE",
                        style: Theme.of(context).textTheme.headline2,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                )
              ],
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
