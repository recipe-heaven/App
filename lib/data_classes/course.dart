import 'package:App/data_classes/user.dart';

class Course {
  User creator;
  var name;
  List<Tag> tags;
  var description;
  var cookTime;
  List<Ingredient> ingredients;
  List<String> cookingSteps;

  Course(
      {this.creator,
      this.name,
      this.tags,
      this.description,
      this.cookTime,
      this.ingredients,
      this.cookingSteps});
}

class Tag {
  var tagName;

  Tag(this.tagName);
}

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
  num amount;
  String unitType;
  String
      comentidk; // if we are going to have the whole finely chopped, cut into cunks osv...

  num getAmount() {
    return amount;
  }

  String getUnitType() {
    return unitType;
  }

  Ingredient({this.name, this.amount, this.unitType, this.comentidk});
}
