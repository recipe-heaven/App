import 'dart:convert';
import 'dart:ui';

import 'package:App/data_classes/displayable.dart';
import 'package:App/data_classes/menu.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/data_classes/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

import 'food_image.dart';

part 'meal.g.dart';

@JsonSerializable(explicitToJson: true)
class Meal extends Displayable {
  List<Recipe> recipes;

  Meal({name, List<Recipe> recipes, int id, User owner, bool public}) {
    this.name = name;
    this.owner = owner;
    this.public = public ?? false;
    this.id = id;
    this.recipes = recipes ?? List<Recipe>();
  }

  /// Create this object from json object map
  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  /// Convert this object to json Map
  Map<String, dynamic> toJson() => _$MealToJson(this);

  @override
  Image get displayImage {
    if (recipes == null || recipes?.length == 0) {
      return FoodImage().defaultImage;
    }
    return recipes.first.displayImage;
  }
}

@JsonSerializable(explicitToJson: true)
class CompleteMeal extends Meal {
  CompleteMeal(
      {String name,
      List<CompleteRecipe> recipes,
      int id,
      User owner,
      bool public})
      : super(
          name: name,
          id: id,
          owner: owner,
          public: public,
          recipes: recipes,
        );

  /// Create this object from json object map
  factory CompleteMeal.fromJson(Map<String, dynamic> json) =>
      _$CompleteMealFromJson(json);

  /// Convert this object to json Map
  Map<String, dynamic> toJson() => _$CompleteMealToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SimpleMeal extends Meal {
  SimpleMeal(
      {String name,
      List<SimpleRecipe> recipes,
      int id,
      User owner,
      bool public})
      : super(
          name: name,
          id: id,
          owner: owner,
          public: public,
          recipes: recipes,
        );

  /// Create this object from json object map
  factory SimpleMeal.fromJson(Map<String, dynamic> json) =>
      _$SimpleMealFromJson(json);

  /// Convert this object to json Map
  Map<String, dynamic> toJson() => _$SimpleMealToJson(this);
}

/// A represents a new meal object, this can be serialized
/// and sent to the server for storing the new meal
@JsonSerializable(explicitToJson: true)
class NewMeal {
  int _id;
  String _name;

  bool _public = false;

  List<Map<String, int>> _recipes = new List();

  NewMeal(String name, bool public, List<int> recipes) {
    this._name = name;
    this._public = public;
    this._recipes = this.createRecipesIdObjects(recipes);
  }

  List<Map<String, int>> createRecipesIdObjects(List<int> recipeIds) {
    List<Map<String, int>> recipemap = new List();
    for (var id in recipeIds) {
      recipemap.add({"id": id});
    }
    return recipemap;
  }

  String get name => _name;
  bool get public => _public;
  List<Map<String, int>> get recipes => _recipes;
  int get id => _id;

  set id(id) => _id = id;

  /// Create this object from json object map
  String toJsonString() => jsonEncode(_$NewMealToJson(this));

  /// Convert this object to json Map
  Map<String, dynamic> toJson() => _$NewMealToJson(this);
}
