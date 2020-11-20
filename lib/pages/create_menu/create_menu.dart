import 'dart:core';
import 'dart:developer';
import 'dart:ui';

import 'package:App/components/form/form_validators.dart';
import 'package:App/components/info_card.dart';
import 'package:App/components/navigation_scaffold.dart';
import 'package:App/components/public_private_dialoug.dart';
import 'package:App/components/time_widget.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/components/input_feald.dart';
import 'package:App/data_classes/menu.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/pages/explore/result_item.dart';
import 'package:App/routes/routes.dart';
import 'package:App/routes/routes_options.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/meal_service.dart';
import 'package:App/service/menu_service.dart';
import 'package:App/service/recipe_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CreateMenuPage extends StatefulWidget {
  final authService = MenuService(HttpServiceClient());
  final Menu menu;
  final _isEditing = false;
  CreateMenuPage({Key key, this.menu}) : super(key: key);

  @override
  CreateMenuPageState createState() => CreateMenuPageState();
}

final _days = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];
final _fadeToCollor = Colors.black; // Color(0xdd000000);

class CreateMenuPageState extends State<CreateMenuPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isEditing = false;

  String _name;

  bool _isPublic = false;

  Map<String, MenuRecipe> _recipes = Map();

  Map<String, MenuMeal> _meals = Map();

  @override
  void initState() {
    super.initState();

    // validatate the menu have all 7 slots fill with null if nececery
    // widget.menu.meals = widget.menu.meals ?? List.filled(7, null);

    // if (widget.menu.meals.length < 7) {
    //   widget.menu.meals = [
    //     ...widget.menu.meals,
    //     ...List.filled(7 - widget.menu.meals.length, null)
    //   ];
    // }
  }

  void _handleNewMeal() async {
    final FormState formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();

      // var res = await widget.authService.addNewMenu(menu: widget.menu);
      // if (res == null) {
      //   setState(() {});
      // } else {
      //   // Do routing, set state
      // }
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
                      widget.menu.public = true;
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

  /// Creates the recipe card that is displayed on the screen with information.
  Widget _createDisplayCard(String title, Image background,
      List<Widget> extraWidgets, VoidCallback removeCardCallback) {
    return InfoCard(
        title: title,
        removeCallback: removeCardCallback,
        background: background,
        children: extraWidgets);
  }

  /// Handles the navigation to search screen, and returns selected results from
  /// search as a map of recipes.
  Future<Map<String, TypeSearchResult>> _searchForRecipesMeals() async {
    final returnResult = await Navigator.pushNamed(context, RouteSearch,
        arguments: SearchRouteOptions(
            returnSelected: true, searchOwnedOnly: true, searchMenus: false));

    if (returnResult == null) return null;

    Map<String, TypeSearchResult> results = returnResult;
    return results;
  }

  Future _handleSearchResult(
      Map<String, TypeSearchResult> result, int day) async {
    List<int> recipeIds = List();
    List<int> mealIds = List();

    for (var item in result.values) {
      if (item.runtimeType == RecipeSearchResult) {
        recipeIds.add(item.id);
      } else if (item.runtimeType == MealSearchResult) {
        mealIds.add(item.id);
      }
    }

    var recipes = await RecipeService().getMultipleMinifiedRecipes(recipeIds);
    for (var recipe in recipes) {
      _recipes["${recipe.id}-$day"] = new MenuRecipe(recipe, day);
    }

    var meals = await MealService().getMultipleMinifiedMeals(mealIds);
    for (var meal in meals) {
      _meals["${meal.id}-$day"] = new MenuMeal(meal, day);
    }
  }

  Widget _make_day_button({String buttonText, int day}) {
    var dayRecipes =
        _recipes.values.where((recipe) => recipe.day == day).map((e) {
      return _createDisplayCard(
          e.recipe.name, e.recipe.getDisplayImage(), [], () {});
    });

    var dayMeals = _meals.values.where((meal) => meal.day == day).map((e) {
      return _createDisplayCard(
          e.meal.name, e.meal.getDisplayImage(), [], () {});
    });

    return Column(
      children: [
        Column(
          children: [
            if (dayMeals != null) ...dayMeals,
            if (dayRecipes != null) ...dayRecipes,
            MaterialButton(
              color: elementBackgroundColor, //Theme.of(context).buttonColor,
              minWidth: double.maxFinite,
              elevation: 10,
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.headline2,
              ),
              onPressed: () async {
                Map<String, TypeSearchResult> result =
                    await _searchForRecipesMeals();
                await _handleSearchResult(result, day);
                // Force redraw of UI
                setState(() {});
              },
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigation(
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
                        "Pefect menu",
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
                              label: "Menu title", onSave: (newValue) {
                            widget.menu.name = newValue;
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
                SetPublicDialog((state) {
                  _isPublic = state;
                }, _isPublic, _isEditing, "Menu"),
                SizedBox(
                  height: 10,
                ),
                for (MapEntry<int, String> entry in _days.asMap().entries)
                  _make_day_button(buttonText: entry.value, day: entry.key),
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
    );
  }
}
