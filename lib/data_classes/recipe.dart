import 'dart:math';

import 'package:App/data_classes/displayable.dart';
import 'package:App/data_classes/food_image.dart';
import 'package:App/data_classes/user.dart';
import 'package:App/helpers/enumHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

List<RecipeStep> _stepsFromJson(String json) {
  List<RecipeStep> a = json
      .split("@&@&@")
      .map((e) => RecipeStep(step: e))
      //   .where((element) => element.runtimeType == RecipeStep)
      .toList();
  return a;
}

String _stepsToJson(List<RecipeStep> steps) {
  return steps.map((e) => e.step).join("@&@&@");
}

List<RecipeDrink> _drinksFromJson(String json) {
  return json.split("@&@&@").map((e) => RecipeDrink(drink: e)).toList();
}

String _drinksToJson(List<RecipeDrink> drinks) {
  return drinks.map((e) => e.drink).join("@&@&@");
}

MealType _mealTypeFromJson(String json) {
  return MealType.values.firstWhere((e) => getStringFromEnum(e) == json);
}

String _mealTypeToJson(MealType mealType) {
  return describeEnum(mealType); //getStringFromEnum(mealType);
}

var _random = Random(928130938120983);

// Måltid
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Recipe extends Displayable {
  String description = "";
  int cookTime = 0;

  @JsonKey(toJson: _mealTypeToJson, fromJson: _mealTypeFromJson)
  MealType type = MealType.main;

  FoodImage image;

  int updated;

  Recipe(
      {String name,
      this.description,
      this.cookTime,
      this.image,
      this.updated,
      MealType type,
      int id,
      User owner,
      bool public}) {
    this.name = name;
    this.id = id;
    this.owner = owner;
    this.public = public ?? false;
    this.type = type ?? MealType.main;
  }

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  @override
  Image get displayImage {
    return (image == null)
        ? FoodImage().defaultImage
        : Image.network(image.getImageUrl(), fit: BoxFit.cover);
  }
}

/// A complete recipe includes all details and fields for displaying a recipe
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class CompleteRecipe extends Recipe {
  List<Tag> tags = [];

  List<Ingredient> recipeIngredients = [];

  @JsonKey(toJson: _stepsToJson, fromJson: _stepsFromJson)
  List<RecipeStep> cookingSteps = [];

  @JsonKey(toJson: _drinksToJson, fromJson: _drinksFromJson)
  List<RecipeDrink> recommendedDrinks = [];

  CompleteRecipe(
      {String name,
      List<Tag> tags,
      String description,
      int cookTime,
      MealType type,
      List<RecipeStep> cookingSteps,
      List<Ingredient> recipeIngredients,
      List<RecipeDrink> recommendedDrinks,
      FoodImage image,
      int id,
      User owner,
      bool public})
      : super(
            id: id,
            name: name,
            description: description,
            cookTime: cookTime,
            owner: owner,
            image: image,
            public: public,
            type: type) {
    this.tags = tags ?? [];
    this.cookingSteps = cookingSteps ?? [];
    this.recommendedDrinks = recommendedDrinks ?? [];
    this.recipeIngredients = recipeIngredients ?? [];
  }

  factory CompleteRecipe.fromJson(Map<String, dynamic> json) =>
      _$CompleteRecipeFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteRecipeToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class SimpleRecipe extends Recipe {
  SimpleRecipe(
      {String name,
      String description,
      int cookTime,
      MealType type,
      FoodImage image,
      int id,
      User owner,
      bool public})
      : super(
            id: id,
            name: name,
            description: description,
            type: type,
            cookTime: cookTime,
            owner: owner,
            public: public,
            image: image);

  factory SimpleRecipe.fromJson(Map<String, dynamic> json) =>
      _$SimpleRecipeFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleRecipeToJson(this);
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
