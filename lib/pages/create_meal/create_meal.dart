import 'dart:ffi';
import 'dart:ui';

import 'package:App/components/form/form_validators.dart';
import 'package:App/components/info_card.dart';
import 'package:App/components/navigation_scaffold.dart';
import 'package:App/components/public_private_dialoug.dart';
import 'package:App/components/time_widget.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/components/input_feald.dart';
import 'package:App/pages/explore/result_item.dart';
import 'package:App/routes/routes.dart';
import 'package:App/routes/routes_options.dart';
import 'package:App/service/meal_service.dart';
import 'package:App/service/recipe_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// TODO: Make it possible to inject meal for editing

class CreateMealPage extends StatefulWidget {
  final MealService mealSearvice = MealService();
  final Meal meal;
  bool _isEditing = false;
  CreateMealPage({Key key, this.meal}) : super(key: key) {
    if (meal != null) _isEditing = true;
  }

  @override
  CreateMealPageState createState() => CreateMealPageState();
}

class CreateMealPageState extends State<CreateMealPage> {
  Map<String, Recipe> starters = Map();
  Map<String, Recipe> mains = Map();
  Map<String, Recipe> desserts = Map();

  String _name = "";
  bool _isPublic = false;

  final _formKey = GlobalKey<FormState>();

  void _handleNewMeal() async {
    final FormState formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();

      List<int> recpideIds = List();

      void addToIdList(Iterable<Recipe> recipes) {
        recipes.forEach((recipe) => recpideIds.add(recipe.id));
      }

      addToIdList(starters.values);
      addToIdList(mains.values);
      addToIdList(desserts.values);

      NewMeal newMeal = NewMeal(_name, _isPublic, recpideIds);

      var res = await widget.mealSearvice.addNewMeal(newMeal: newMeal);

      if (res) {
        setState(() {});
      } else {
        // Do routing, set state
      }
    }
  }

  /// Returns true if there are any recipes in any of the categories, else false
  bool _hasRecipes() {
    return (starters.isNotEmpty || mains.isNotEmpty || desserts.isNotEmpty);
  }

  /// Creates map list of recipes with key as id and name of recipe.
  /// To ensure only one of each ID/type is allowed
  Map<String, Recipe> createRecipeMap(List<Recipe> recipes) {
    Map<String, Recipe> recipesMapped = Map();

    for (var recipe in recipes) {
      recipesMapped["${recipe.id}${recipe.type}"] = recipe;
    }
    return recipesMapped;
  }

  @protected
  void initState() {}

  /// Creates the recipe card that is displayed on the screen with information.
  Widget _createRecipeCard(
      MapEntry<String, Recipe> recipe, VoidCallback removeCardCallback) {
    return InfoCard(
        title: recipe.value.name,
        removeCallback: removeCardCallback,
        background: recipe.value.image.id.toString(),
        children: [TimeWidget(timeInSeconds: recipe.value.cookTime)]);
  }

  /// Handles the navigation to search screen, and returns selected results from
  /// search as a map of recipes.
  Future<Map<String, Recipe>> _searchForType(MealType mealtype) async {
    final returnResult = await Navigator.pushNamed(context, RouteSearch,
        arguments: SearchRouteOptions(
            returnSelected: true,
            recipeType: describeEnum(mealtype),
            searchOwnedOnly: true,
            searchMenus: false,
            searchMeals: false));

    if (returnResult == null) return null;

    Map<String, TypeSearchResult> results = returnResult;

    List<int> ids = results.entries.map((e) => e.value.id).toList();
    var recipes = await RecipeService().getMultipleMinifiedRecipes(ids);

    return createRecipeMap(recipes);
  }

  Widget _createCategorySelector(
      {String buttonText,
      VoidCallback onClick,
      Map<String, Recipe> categotyItems}) {
    return Column(
      children: [
        Column(
          children: [
            for (var recipe in categotyItems.entries) ...[
              _createRecipeCard(
                recipe,
                () {
                  setState(() {
                    categotyItems.remove(recipe.key);
                  });
                },
              ),
            ],
            SizedBox(
              height: 20,
            ),
            MaterialButton(
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
              onPressed: onClick,
            ),
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
                          "Put together the\nperfect meal",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Form(
                          key: _formKey,
                          child: secondaryInputField(context,
                              label: "Meal title", onSave: (newValue) {
                            _name = newValue;
                          },
                              validator: validateNotEmptyInput,
                              hint: "Easy every day meal"),
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
          SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
            child: Column(
              children: [
                SetPublicDialog((state) {
                  _isPublic = state;
                }, _isPublic, widget._isEditing, "Meal"),
                SizedBox(
                  height: 10,
                ),
                _createCategorySelector(
                    buttonText: "ADD STARTERS",
                    onClick: () async {
                      var newRecipe =
                          await this._searchForType(MealType.starter);
                      if (newRecipe != null) {
                        setState(() {
                          starters.addAll(newRecipe);
                        });
                      }
                    },
                    categotyItems: starters),
                _createCategorySelector(
                    buttonText: "ADD COURSE",
                    onClick: () async {
                      var newRecipe = await this._searchForType(MealType.main);
                      if (newRecipe != null) {
                        setState(() {
                          mains.addAll(newRecipe);
                        });
                      }
                    },
                    categotyItems: mains),
                _createCategorySelector(
                    buttonText: "ADD DESSERT",
                    onClick: () async {
                      var newRecipe =
                          await this._searchForType(MealType.dessert);
                      if (newRecipe != null) {
                        setState(() {
                          desserts.addAll(newRecipe);
                        });
                      }
                    },
                    categotyItems: desserts),

                SizedBox(
                  height: 20,
                ),
                // TODO: MAYBE CHANGE TO CIRCULAR BUTTON SAME AS CREATE RECIPE
                MaterialButton(
                    onPressed: _hasRecipes() ? _handleNewMeal : null,
                    disabledColor: disabledAcceptColor,
                    color: acceptColor,
                    height: 50,
                    minWidth: double.maxFinite,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "SAVE",
                      style: _hasRecipes()
                          ? Theme.of(context).textTheme.headline2
                          : Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(color: Colors.grey),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
