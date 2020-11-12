import 'dart:ui';

import 'package:App/data_classes/recipe.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

import 'food_image.dart';

part 'meal.g.dart';

@JsonSerializable(explicitToJson: true)
class Meal {
  String name = "";
  String owner = "";
  bool public = false;

  Image getDisplayImage() {
    if (recipe == null || recipe?.length == 0) {
      return FoodImage().default_image;
    }
    return recipe.first.getDisplayImage();
  }

  List<Recipe> recipe;

  Meal({recipe}) : this.recipe = recipe ?? List<Recipe>();

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
  Map<String, dynamic> toJson() => _$MealToJson(this);
}
