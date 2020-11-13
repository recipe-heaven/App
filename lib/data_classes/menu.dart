import 'package:App/data_classes/recipe.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meal.dart';

part 'menu.g.dart';

@JsonSerializable(explicitToJson: true)
class Menu with UserOwned {
  String name;

  List<Meal> meals;

  Menu({this.name, this.meals, public, owner, id}) {
    this.owner = owner;
    this.public = public ?? false;
    this.id = id;

    this.name = name ?? "";
    this.meals = meals ?? new List<Meal>();
  }

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}

class MenuCourse {
  Recipe recipe;
  String day;
}
