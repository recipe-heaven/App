import 'dart:math';

import 'package:App/data_classes/user.dart';
import 'package:flutter/cupertino.dart';

// Måltid
class Recipe {
  User creator;
  String name = "aaaaa";
  List<Tag> tags = [];
  String description = "";
  int cookTime = 0;
  String type = ""; // starter/main/dessert
  bool public = false;
  List<Ingredient> ingredients = [];
  List<RecipeStep> cookingSteps = [];
  List<String> recommendedDrinks = [];

  Recipe(
      {this.creator,
      this.name = "aa",
      tags,
      this.description,
      this.cookTime,
      ingredients,
      cookingSteps})
      : this.ingredients = ingredients ?? [],
        this.cookingSteps = cookingSteps ?? [],
        this.tags = tags ?? [];
}

// tar ikke med hashtag til server
class Tag {
  String tagName;

  Tag(this.tagName);
}

// us

///
/// 3 different classes
///   - volume
///   - mass
///   - units
///

// TODO: fill these somehow
List<String> volumeUnits;
List<String> massUnits;
List<String> unitUnits;

//shitty language shitty solutions
enum IngredientUnit { a, b, c, d }
var _random = Random(928130938120983);

class RecipeStep {
  Key key;
  String step = "";
  RecipeStep({String step})
      : this.key = Key(_random.nextDouble().toString()),
        this.step = step ?? "";
}

// this comes from the db
class Ingredient {
  Key key;
  String name = "";
  num amount = 0; // metric
  IngredientUnit unitType; // g ml cup
  String comment = ""; // if we are going to have the whole finely chopped

  num getAmount() {
    return amount;
  }

  IngredientUnit getUnitType() {
    return unitType;
  }

  Ingredient(
      {this.name = "",
      this.amount = 0,
      unitType = IngredientUnit,
      this.comment = ""})
      : this.unitType = IngredientUnit.a,
        this.key = Key(_random.nextDouble().toString());
}
