import 'package:App/data_classes/user.dart';

// Måltid
class Recipe {
  User creator;
  String name;
  List<Tag> tags;
  String description;
  int cookTime;
  String type; // starter/main/dessert
  bool public;
  List<Ingredient> ingredients;
  List<String> cookingSteps;
  List<String> recommendedDrinks;

  Recipe(
      {this.creator,
      this.name,
      this.tags,
      this.description,
      this.cookTime,
      this.ingredients,
      this.cookingSteps});
}

// tar ikke med hashtag til server
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

// this comes from the db
class Ingredient {
  String name;
  num amount; // metric
  String unitType; // g ml cup
  String comment; // if we are going to have the whole finely chopped

  num getAmount() {
    return amount;
  }

  String getUnitType() {
    return unitType;
  }

  Ingredient({this.name, this.amount, this.unitType, this.comment});
}
