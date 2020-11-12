import 'package:App/data_classes/recipe.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meal.dart';

part 'menu.g.dart';

@JsonSerializable(explicitToJson: true)
class Menu {
  String name;
  String owner;
  bool public;

  List<Meal> meals;

  Menu({name, owner, public, meals})
      : this.name = name ?? "",
        this.owner = owner,
        this.public = public ?? false,
        this.meals = meals ?? new List<Meal>();

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}

class MenuCourse {
  Recipe recipe;
  String day;
}
