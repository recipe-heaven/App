import 'dart:convert';
import 'dart:ui';

import 'package:App/data_classes/recipe.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

import 'food_image.dart';

part 'meal.g.dart';

@JsonSerializable(explicitToJson: true)
class Meal with UserOwned {
  String name = "";

  Image getDisplayImage() {
    if (recipes == null || recipes?.length == 0) {
      return FoodImage().default_image;
    }
    return recipes.first.getDisplayImage();
  }

  List<Recipe> recipes;

  Meal({this.name, List<Recipe> recipe, int id, User owner, bool public}) {
    this.owner = owner;
    this.public = public ?? false;
    this.id = id;
    this.recipes = recipe ?? List<Recipe>();
  }

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
  Map<String, dynamic> toJson() => _$MealToJson(this);
}

/// A represents a new meal object, this can be serialized
/// and sent to the server for storing the new meal
@JsonSerializable(explicitToJson: true)
class NewMeal {
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

  String toJsonString() => jsonEncode(_$NewMealToJson(this));
  Map<String, dynamic> toJson() => _$NewMealToJson(this);
}
