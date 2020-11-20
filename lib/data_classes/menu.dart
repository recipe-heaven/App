import 'dart:convert';

import 'package:App/data_classes/recipe.dart';
import 'package:App/data_classes/user.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meal.dart';

part 'menu.g.dart';

@JsonSerializable(explicitToJson: true)
class Menu with UserOwned {
  String name;

  List<MenuMeal> meals;

  List<MenuRecipe> recipes;

  Menu({this.name, this.meals, this.recipes, int id, User owner, bool public}) {
    this.owner = owner;
    this.public = public ?? false;
    this.id = id;
    this.name = name ?? "";
    this.meals = meals ?? new List<Meal>();
  }

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}

@JsonSerializable()
class MenuDay {
  int day;
}

abstract class Displayable {
  String get name;
  String get public;
  String get update;
}

@JsonSerializable(explicitToJson: true)
class MenuMeal with MenuDay {
  SimpleMeal meal;

  MenuMeal(this.meal, int day) {
    this.day = day;
  }

  factory MenuMeal.fromJson(Map<String, dynamic> json) =>
      _$MenuMealFromJson(json);
  Map<String, dynamic> toJson() => _$MenuMealToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MenuRecipe with MenuDay {
  Recipe recipe;

  MenuRecipe(this.recipe, int day) {
    this.day = day;
  }

  factory MenuRecipe.fromJson(Map<String, dynamic> json) =>
      _$MenuRecipeFromJson(json);
  Map<String, dynamic> toJson() => _$MenuRecipeToJson(this);
}

/// A represents a new menu object, which can be serialized to json for
/// creating a new or updating a menu
@JsonSerializable(explicitToJson: true)
class NewMenu {
  int _id;

  String _name;

  bool _public = false;

  List<MenuRecipe> _recipes = new List();

  List<MenuMeal> _meals = new List();

  NewMenu(String name, bool public, List<MenuRecipe> recipes,
      List<MenuMeal> meals) {
    this._name = name;
    this._public = public;
    this._recipes = recipes;
    this._meals = meals;
  }

  String get name => _name;

  bool get public => _public;

  List<MenuRecipe> get recipes => _recipes;

  List<MenuMeal> get meals => _meals;

  int get id => _id;

  set id(id) => _id = id;

  String toJsonString() => jsonEncode(_$NewMenuToJson(this));
  Map<String, dynamic> toJson() => _$NewMenuToJson(this);
}
