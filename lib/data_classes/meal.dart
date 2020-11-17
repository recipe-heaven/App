import 'dart:ui';

import 'package:App/data_classes/recipe.dart';
import 'package:App/data_classes/user.dart';
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
