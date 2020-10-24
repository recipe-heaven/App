import 'package:App/data_classes/course.dart';

class User {
  num id;
  String email;
  String name;
  UserSettings settings;
}

class UserSettings {
  String unit; // metric / imperial
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
