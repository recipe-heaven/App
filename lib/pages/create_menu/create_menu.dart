import 'dart:core';
import 'dart:ui';

import 'package:App/components/form/form_validators.dart';
import 'package:App/components/info_card.dart';
import 'package:App/components/navigation_scaffold.dart';
import 'package:App/components/public_private_dialoug.dart';
import 'package:App/components/input_feald.dart';
import 'package:App/components/round_button.dart';
import 'package:App/components/saved_snackbar.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/data_classes/menu.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/routes/routes.dart';
import 'package:App/routes/routes_options.dart';
import 'package:App/service/menu_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CreateMenuPage extends StatefulWidget {
  final Menu menu;
  CreateMenuPage({Key key, this.menu}) : super(key: key);

  @override
  CreateMenuPageState createState() => CreateMenuPageState();
}

class CreateMenuPageState extends State<CreateMenuPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isEditing = false;

  String _name;

  bool _isPublic = false;

  Map<String, MenuItem> _recipes = Map();

  Map<String, MenuItem> _meals = Map();

  @override
  void initState() {
    super.initState();

    if (widget.menu != null) {
      _isEditing = true;
      _name = widget.menu.name;
      _isPublic = widget.menu.public;
      for (var dayItem in widget.menu.getMenuItems()) {
        if (dayItem.item.runtimeType == Meal) {
          _addMenuMealToDisplayMap(dayItem);
        } else if (dayItem.item.runtimeType == Recipe) {
          _addMenuRecipeToDisplayMap(dayItem);
        }
      }
    }
  }

  /// Checks if there are any recipes or meals, returns true if atleast one of them
  /// is not empty
  bool _hasItemsInAnyDay() {
    return (_recipes.isNotEmpty || _meals.isNotEmpty);
  }

  void _handleNewMenu(BuildContext context) async {
    final FormState formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();

      NewMenu newMenu =
          NewMenu(_name, _isPublic, [..._meals.values, ..._recipes.values]);

      var res = false;

      if (_isEditing) {
        newMenu.id = widget.menu.id;
        res = await MenuService.updateMenu(updatedMenu: newMenu);
      } else {
        res = await MenuService.addNewMenu(newMenu: newMenu);
      }

      if (res) {
        if (_isEditing) {
          displaySavedSnackbar("menu", context, updated: true);
        } else {
          displaySavedSnackbar("menu", context);
        }
      } else {
        displaySavedSnackbar("menu", context, error: true);
      }
    }
  }

  void _addMenuRecipeToDisplayMap(MenuItem menuRecipe) {
    _recipes["${menuRecipe.item.id}-${menuRecipe.day}"] = menuRecipe;
  }

  void _addMenuMealToDisplayMap(MenuItem menuMeal) {
    _meals["${menuMeal.item.id}-${menuMeal.day}"] = menuMeal;
  }

  /// Creates the recipe card that is displayed on the screen with information about the meal/recipe.
  /// It contains a title, a background image, optional eextra widgets and a callback for
  /// removing the card.
  Widget _createDisplayCard(String title, Image background,
      List<Widget> extraWidgets, VoidCallback removeCardCallback) {
    return InfoCard(
        title: title,
        removeCallback: removeCardCallback,
        background: background,
        children: extraWidgets);
  }

  /// Handles the navigation to search screen, and returns selected results from
  /// search as a map of dynamic.
  Future<Map<String, dynamic>> _searchForRecipesAndMeals() async {
    final returnResult = await Navigator.pushNamed(context, RouteSearch,
        arguments: SearchRouteOptions(
            returnSelected: true,
            searchOwnedOnly: true,
            searchMenus: false,
            multiSelect: true));

    if (returnResult == null) return Map();
    return returnResult as Map<String, dynamic>;
  }

  /// Filters the types from the search result into their belonging category
  /// MenuRecipe / MenuMeal and adds them to their beloning map with key as
  /// id-day so that a type can be added to two different days, but only
  /// one of same for any day.
  Future _handleSearchResult(Map<String, dynamic> result, int day) async {
    for (var resu in result.entries) {
      if (resu.value.runtimeType == Recipe) {
        _recipes[resu.key] = new MenuItem(resu.value, day);
      } else if (resu.value.runtimeType == Meal) {
        _meals[resu.key] = new MenuItem(resu.value, day);
      }
    }
  }

  /// Creates clickable button which directs a click to the search screen.
  /// The selected results are passed to filtering so that the results are
  /// added to a dispaly map where the results are added to the day tht is provied
  /// to this function.
  Widget _createDayButton(String buttonText, int day) {
    return MaterialButton(
      color: elementBackgroundColor, //Theme.of(context).buttonColor,
      height: 50,
      elevation: 4,
      minWidth: double.maxFinite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        buttonText,
        style: Theme.of(context).accentTextTheme.headline2,
      ),
      onPressed: () async {
        Map<String, dynamic> result = await _searchForRecipesAndMeals();
        await _handleSearchResult(result, day);
        // Force redraw of UI
        setState(() {});
      },
    );
  }

  /// Creates a widget that represents a day. The widget includes a button for adding
  /// new recipes/meals to the day, and list of all recipes/meals for that day.
  Widget _createDayWidget({String buttonText, int day}) {
    var dayRecipes =
        _recipes.entries.where((recipe) => recipe.value.day == day).map((e) {
      return _createDisplayCard(
          e.value.item.name, e.value.item.displayImage, [], () {
        setState(() {
          _recipes.remove(e.key);
        });
      });
    });

    var dayMeals =
        _meals.entries.where((meal) => meal.value.day == day).map((e) {
      return _createDisplayCard(
          e.value.item.name, e.value.item.displayImage, [], () {
        setState(() {
          _meals.remove(e.key);
        });
      });
    });

    return Column(
      children: [
        Column(
          children: [
            if (dayMeals != null) ...dayMeals,
            if (dayRecipes != null) ...dayRecipes,
            SizedBox(
              height: 20,
            ),
            _createDayButton(buttonText, day),
            SizedBox(
              height: 20,
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigation(
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
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
                              "Put together the\nperfect menu",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Form(
                                key: _formKey,
                                child: secondaryInputField(context,
                                    initialValue: _name,
                                    label: "Menu title", onSave: (newValue) {
                                  _name = newValue;
                                },
                                    validator: validateNotEmptyInput,
                                    hint: "Menu for hectic days")),
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
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
                child: Column(
                  children: [
                    SetPublicDialog((state) {
                      _isPublic = state;
                    }, _isPublic, _isEditing, "Menu"),
                    SizedBox(
                      height: 10,
                    ),
                    for (MapEntry<int, String> entry
                        in Menu.days.asMap().entries)
                      _createDayWidget(buttonText: entry.value, day: entry.key),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: RoundButton(_hasItemsInAnyDay()
                            ? () => _handleNewMenu(context)
                            : null)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
