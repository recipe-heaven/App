import 'dart:convert';

import 'package:App/data_classes/displayable.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/data_classes/user.dart';
import 'package:App/data_classes/user_owned.dart';
import 'package:App/helpers/consts.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meal.dart';

part 'menu.g.dart';

List<MenuItem> _menuItemsFromJson(List<dynamic> k) {
  List<MenuItem> items = List();
  try {
    for (var item in k) {
      if (item[meal_type_name] != null) {
        items.add(
            new MenuItem(Meal.fromJson(item[meal_type_name]), item["day"]));
      } else if (item[recipe_type_name] != null) {
        items.add(
            new MenuItem(Recipe.fromJson(item[recipe_type_name]), item["day"]));
      }
    }
  } on Exception {}
  return items;
}

mixin MenuDay {
  int day;
}

@JsonSerializable(explicitToJson: true)
class Menu extends Displayable {
  @JsonKey(fromJson: _menuItemsFromJson)
  List<MenuItem> meals;

  @JsonKey(fromJson: _menuItemsFromJson)
  List<MenuItem> recipes;

  Menu(
      {String name,
      List<MenuItem> meals,
      List<MenuItem> recipes,
      int id,
      User owner,
      bool public}) {
    this.meals = meals ?? [];
    this.recipes = recipes ?? [];
    this.owner = owner;
    this.public = public ?? false;
    this.id = id;
    this.name = name ?? "";
  }

  @JsonKey(ignore: true)
  List<MenuItem> getMenuItems() {
    return [...meals, ...recipes];
  }

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);

  @JsonKey(ignore: true)
  static final days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  @override
  Image get displayImage {
    return recipes.first.item.displayImage;
  }

  List<int> get daysInMenu {
    return this.getMenuItems().map((element) {
      return element.day;
    }).toList();
  }
}

Displayable _menuItemFromJson(String displayable) {
  return null;
}

Map<String, dynamic> _menuItemToJson(Displayable json) {
  return null;
}

@JsonSerializable()
class MenuItem with MenuDay {
  @JsonKey(toJson: _menuItemToJson, fromJson: _menuItemFromJson)
  Displayable item;

  MenuItem(this.item, day) {
    this.day = day;
  }

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}

/// Convert the menuItems to structure that matches the server enpoint
/// for updating/creating menus.
List<dynamic> _menuItemsToJson(List<MenuItem> menuItems) {
  List<dynamic> items = List();
  for (var menuItem in menuItems) {
    items.add({
      "type": menuItem.item.runtimeType == Recipe ? "reicpe" : "meal",
      "menuDayItem": {"id": menuItem.item.id},
      "day": menuItem.day
    });
  }
  return items;
}

/// A represents a new menu object, which can be serialized to json for
/// creating a new or updating a menu
@JsonSerializable(explicitToJson: true)
class NewMenu extends UserOwned {
  String _name;

  List<MenuItem> _menuItems = new List();

  NewMenu(String name, bool public, List<MenuItem> items) {
    this._name = name;
    this.public = public;
    this._menuItems = items;
  }

  String get name => _name;

  @JsonKey(name: "menuItems", toJson: _menuItemsToJson)
  List<MenuItem> get items => _menuItems;

  String toJsonString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$NewMenuToJson(this);
}
