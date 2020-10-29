import 'package:App/data_classes/recipe.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meal.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  String name;
  String owner;
  String public;

  List<Meal> meals;

  Menu();
  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}

class MenuCourse {
  Recipe recipe;
  String day;
}
