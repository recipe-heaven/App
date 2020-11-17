import 'dart:ffi';
import 'dart:ui';

import 'package:App/components/form/form_validators.dart';
import 'package:App/components/navigation_scaffold.dart';
import 'package:App/components/public_private_dialoug.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/helpers/enumHelper.dart';
import 'package:App/helpers/time.dart';
import 'package:App/main.dart';
import 'package:App/components/input_feald.dart';
import 'package:App/pages/explore/result_item.dart';
import 'package:App/routes/routes.dart';
import 'package:App/routes/routes_options.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/meal_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// TODO: Move to use Simplified recipe type instead of RecipeSearchResult
// TODO: Make it possible to inject meal for editing
// TODO: Create a common recipe widget

class CreateMealPage extends StatefulWidget {
  final mealSearvice = MealService();

  final _meal = TEST_DATA;
  final _isEditing = false;
  CreateMealPage({Key key}) : super(key: key);

  @override
  CreateMealPageState createState() => CreateMealPageState();
}

final _fadeToCollor = Colors.black; // Color(0xdd000000);

class CreateMealPageState extends State<CreateMealPage> {
  Map<String, RecipeSearchResult> starters = Map();
  Map<String, RecipeSearchResult> mains = Map();
  Map<String, RecipeSearchResult> desserts = Map();

  String _name = "";
  bool _isPublic = false;

  final _formKey = GlobalKey<FormState>();

  void _handleNewMeal() async {
    final FormState formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();

      List<int> recpideIds = List();

      void addToIdList(Iterable<RecipeSearchResult> recipes) {
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

  Widget _make_recipe_card(MapEntry<String, RecipeSearchResult> recipe,
      VoidCallback removeCardCallback) {
    return Container(
      height: 160,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                          begin: Alignment(-0.5, -0.3),
                          end: Alignment(-0.60, 3),
                          colors: [_fadeToCollor, Colors.transparent])
                      .createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  "assets/images/BANNER-NEW-MEAL.png",
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
                      onPressed: removeCardCallback,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
                Spacer(),
                Container(
                  constraints: BoxConstraints.expand(height: 70),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(recipe.value.name, style: TextStyle(fontSize: 26)),
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: primaryTextColor,
                            size: 16.0,
                            semanticLabel: 'Clock icon',
                          ),
                          SizedBox(width: 2),
                          Text(
                              getHourSecndsStringFromSeconds(
                                  recipe.value.cookTime),
                              style:
                                  Theme.of(context).accentTextTheme.headline4),
                        ],
                      ),
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

  Future<Map<String, RecipeSearchResult>> _searchForType(
      MealType mealtype) async {
    final returnResult = await Navigator.pushNamed(context, RouteSearch,
        arguments: SearchRouteOptions(
            returnSelected: true,
            recipeType: describeEnum(mealtype),
            searchOwnedOnly: true,
            searchMenus: false,
            searchMeals: false));

    if (returnResult == null) return null;

    // TODO IMPLEMENT FETCH OF RECIPES HERE WHEN TYPE IS READY
    Map<String, TypeSearchResult> results = returnResult;
    Map<String, RecipeSearchResult> recipes = Map();
    for (var item in results.entries) {
      recipes[item.key] = item.value as RecipeSearchResult;
    }
    return recipes;
  }

  Widget _create_category_selector(
      {String buttonText,
      VoidCallback onClick,
      Map<String, RecipeSearchResult> categotyItems}) {
    return Column(
      children: [
        Column(
          children: [
            for (var recipe in categotyItems.entries) ...[
              _make_recipe_card(
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
                SetPublicDialog(widget._meal, widget._isEditing, "Meal"),
                SizedBox(
                  height: 10,
                ),
                _create_category_selector(
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
                _create_category_selector(
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
                _create_category_selector(
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
