import 'dart:math';

import 'package:App/data_classes/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

// Måltid
@JsonSerializable()
class Recipe {
  User creator;
  String name = "";
  List<Tag> tags = [];
  String description = "";
  int cookTime = 0;
  String type = ""; // starter/main/dessert
  bool public = false;
  List<Ingredient> ingredients = [];
  List<RecipeStep> cookingSteps = [];
  List<String> recommendedDrinks = [];

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  Recipe(
      {this.creator,
      this.name = "",
      tags,
      type,
      this.description,
      this.cookTime,
      ingredients,
      cookingSteps})
      : this.ingredients = ingredients ?? [],
        this.cookingSteps = cookingSteps ?? [],
        this.tags = tags ?? [],
        this.type = type ?? "";
}

// tar ikke med hashtag til server
@JsonSerializable()
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

@JsonSerializable()
class RecipeStep {
  @JsonKey(ignore: true)
  Key key;

  String step = "";
  RecipeStep({String step})
      : this.key = Key(_random.nextDouble().toString()),
        this.step = step ?? "";
  factory RecipeStep.fromJson(Map<String, dynamic> json) =>
      _$RecipeStepFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeStepToJson(this);
}

// this comes from the db
@JsonSerializable()
class Ingredient {
  @JsonKey(ignore: true)
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

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
