import 'dart:collection';
import 'dart:math';

import 'package:App/data_classes/food_image.dart';
import 'package:App/data_classes/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

List<RecipeStep> _stepsFromJson(String json) {
  return json.split("@&@&@").map((e) => RecipeStep(step: e));
}

String _stepsToJson(List<RecipeStep> steps) {
  return steps.map((e) => e.step).join("@&@&@");
}

List<RecipeDrink> _drinksFromJson(String json) {
  return json.split("@&@&@").map((e) => RecipeDrink(drink: e));
}

String _drinksToJson(List<RecipeDrink> drinks) {
  return drinks.map((e) => e.drink).join("@&@&@");
}

var _random = Random(928130938120983);
mixin UserOwned {
  @JsonKey(ignore: true)
  int id;
  User owner = null;
  bool public = false;
}

// Måltid
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Recipe with UserOwned {
  String name = "";
  List<Tag> tags = [];
  String description = "";
  int cookTime = 0;
  MealType type = MealType.main;
  bool visible = false;
  List<Ingredient> recipeIngredients = [];

  @JsonKey(toJson: _stepsToJson, fromJson: _stepsFromJson)
  List<RecipeStep> cookingSteps = [];

  @JsonKey(toJson: _drinksToJson, fromJson: _drinksFromJson)
  List<RecipeDrink> recommendedDrinks = [];

  FoodImage recipeImage = null;

  Image getDisplayImage() {
    return (recipeImage == null)
        ? FoodImage().default_image
        : Image.network(
            recipeImage.getImageUrl(),
          );
  }

  Recipe(
      {this.name,
      tags,
      this.description,
      this.cookTime,
      type,
      this.visible,
      recipeIngredients,
      cookingSteps,
      recommendedDrinks,
      this.recipeImage,
      id,
      owner,
      public}) {
    this.owner = owner;
    this.public = public ?? false;
    this.id = id;

    this.recommendedDrinks = recommendedDrinks ?? [];
    this.recipeIngredients = recipeIngredients ?? [];
    this.cookingSteps = cookingSteps ?? [];
    this.tags = tags ?? [];
    this.type = type ?? MealType.main;
    this.id = id ?? null;
  }

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

class RecipeDrink {
  Key key;

  String drink = "";
  RecipeDrink({String drink})
      : this.key = Key(_random.nextDouble().toString()),
        this.drink = drink ?? "";
}

// tar ikke med hashtag til server
@JsonSerializable()
class Tag {
  String tagName;

  Tag(this.tagName);

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
  Map<String, dynamic> toJson() => _$TagToJson(this);
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
enum MealType { starter, main, dessert }
enum IngredientUnit { kg, cm, lumen, liter }

Map<MealType, String> mealTypeDisplayNames = {
  MealType.starter: "starter",
  MealType.main: "main",
  MealType.dessert: "dessert",
};

Map<IngredientUnit, String> ingredientUnitDisplayNames = {
  IngredientUnit.kg: "kg",
};

class RecipeStep {
  Key key;

  String step = "";
  RecipeStep({String step})
      : this.key = Key(_random.nextDouble().toString()),
        this.step = step ?? "";
}

// this comes from the db
@JsonSerializable()
class Ingredient {
  @JsonKey(ignore: true)
  Key key;
  String name = "";
  num amount = 0; // metric
  @JsonKey(ignore: true)
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
      : this.unitType = IngredientUnit.kg,
        this.key = Key(_random.nextDouble().toString());

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
