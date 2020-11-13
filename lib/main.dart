import 'package:App/routes/router.dart';
import 'package:App/routes/routes.dart' as route_names;
import 'package:App/app_state.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/user_service.dart';

import 'package:App/app_state.dart';
import 'package:App/routes/router.dart';
import 'package:App/routes/routes.dart' as route_names;
import 'package:App/service/http_client.dart';
import 'package:App/service/user_service.dart';
import 'package:App/theme/themes.dart' as app_themes;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:App/theme/themes.dart' as app_themes;
import 'package:provider/provider.dart';
import 'data_classes/meal.dart';
import 'data_classes/menu.dart';
import 'data_classes/recipe.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppState(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _StateSetup(context);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: app_themes.mainTheme.copyWith(), //ThemeData.dark(),
        // for easy testing of pr
        initialRoute: route_names.RouteHome, //route_names.RouteHome,
        onGenerateRoute: (settings) => router(context, settings));
  }
}

/// Provides facilities for setting application state and setup required when
/// the application starts.
class _StateSetup {
  BuildContext _context;

  AppState _appState;
  _StateSetup(this._context) {
    _appState = Provider.of<AppState>(_context, listen: false);
    _initState();
  }

  void _initState() {
    _setInitialUserState();
  }

  /// Will try to get user from stored token, and set the user state, by fetching
  /// the user from the server.
  void _setInitialUserState() async {
    var userService = UserService(HttpClient());
    _appState.user = await userService.getCurrentUser();
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

final TEST_DATA = Meal(name: "aslkdjal", recipe: [
  Recipe(
      type: MealType.main,
      cookingSteps: [
        RecipeStep(step: "steg 1 jør noe"),
        RecipeStep(step: "bipetibo"),
        RecipeStep(step: "lang neste"),
        RecipeStep(
            step:
                "He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful… the only thing he was afraid of was losing his power, which eventually, of course, he did. Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. Ironic. He could save others from death, but not himself.")
      ],
      cookTime: 1999999,
      description:
          "Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It's not a story the Jedi would tell you. It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life… ",
      name: "nvajnens",
      tags: [
        Tag("#canibalism"),
        Tag("#edgy"),
        Tag("#javasucks"),
        Tag("#tagName")
      ],
      recipeIngredients: [
        Ingredient(
            amount: 1000,
            unitType: IngredientUnit.kg,
            name: "gravel",
            comment: "finely ground"),
        Ingredient(
            amount: 2,
            unitType: IngredientUnit.cm,
            name: "penguin",
            comment: "nawww"),
        Ingredient(
            amount: 2,
            unitType: IngredientUnit.cm,
            name: "planks",
            comment: "without nails"),
        Ingredient(
            amount: 20,
            unitType: IngredientUnit.cm,
            name: "screens",
            comment: "waaaaa"),
        Ingredient(
            amount: 88,
            unitType: IngredientUnit.cm,
            name: "keys",
            comment: "waaaa"),
      ]),
  Recipe(
      type: MealType.dessert,
      cookingSteps: [
        RecipeStep(step: "steg 1 jør noe"),
        RecipeStep(step: "bipetibo"),
        RecipeStep(step: "lang neste"),
        RecipeStep(
            step:
                "He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful… the only thing he was afraid of was losing his power, which eventually, of course, he did. Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. Ironic. He could save others from death, but not himself.")
      ],
      cookTime: 1999999,
      description:
          "Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It's not a story the Jedi would tell you. It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life… ",
      name: "nvajnens",
      tags: [
        Tag("#canibalism"),
        Tag("#edgy"),
        Tag("#javasucks"),
        Tag("#tagName")
      ],
      recipeIngredients: [
        Ingredient(
            amount: 1000,
            unitType: IngredientUnit.kg,
            name: "gravel",
            comment: "finely ground"),
        Ingredient(
            amount: 2,
            unitType: IngredientUnit.cm,
            name: "penguin",
            comment: "nawww"),
        Ingredient(
            amount: 2,
            unitType: IngredientUnit.cm,
            name: "planks",
            comment: "without nails"),
        Ingredient(
            amount: 20,
            unitType: IngredientUnit.cm,
            name: "screens",
            comment: "waaaaa"),
        Ingredient(
            amount: 88,
            unitType: IngredientUnit.cm,
            name: "keys",
            comment: "waaaa"),
      ]),
]);
final TEST_MENU = Menu(meals: [TEST_DATA, TEST_DATA, null, null, TEST_DATA]);
