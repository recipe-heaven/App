import 'package:App/data_classes/recipe.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  num id;
  String email;
  String name;
  String username;
  UserSettings settings;

  User(
      {@required this.id,
      @required this.email,
      @required this.name,
      @required this.username,
      @required this.settings});

  // Creates a new user object from JSON
  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //       id: json["id"],
  //       email: json["email"],
  //       name: json["name"],
  //       username: json["username"],
  //       settings: json["settings"]);
  // }
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserSettings {
  String unit; // metric / imperial

  UserSettings();
  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);
}

class ActiveMenu {
  int menuId;
}

class ShoppingList {
  List<ExtraItem> extra;
  List<IngredientItem> ingredient;
}

abstract class ShopItem {
  get name;

  get quantity;

  get hasItem;
}

// Bleier og dorull
class ExtraItem implements ShopItem {
  String _item;
  int _quantity;
  bool _owned;

  @override
  get hasItem => _owned;

  @override
  get name => _item;

  @override
  get quantity => _quantity;
}

class IngredientItem implements ShopItem {
  int _recipeId;
  Ingredient _ingredient;
  bool _owned;

  @override
  get hasItem => _owned;

  @override
  get name => _ingredient.name;

  @override
  get quantity => _ingredient.amount;
}
