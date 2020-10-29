import 'package:App/data_classes/recipe.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@JsonSerializable()
class Meal {
  String name = "";
  String owner = "";
  bool public = false;

  List<Recipe> recipe;

  Meal({recipe}) : this.recipe = recipe ?? List<Recipe>();
  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
  Map<String, dynamic> toJson() => _$MealToJson(this);
}
