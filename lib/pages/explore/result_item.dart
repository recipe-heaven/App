import 'package:App/helpers/symbolize_map_keys.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_item.g.dart';

/**
 * Result item is a type and data holder for a dynamic result, where the data
 * can be "anything" and can be used to filter out and 
 */
@JsonSerializable()
class ResultItem {
  String type;

  dynamic data;

  ResultItem(this.type, this.data);

  factory ResultItem.fromJson(Map<String, dynamic> json) =>
      _$ResultItemFromJson(json);
}

abstract class TypeSearchResult {
  String name;
  int id;

  inject();
}

class RecipeSearchResult extends TypeSearchResult {
  num cookTime;

  RecipeSearchResult();

  factory RecipeSearchResult.fromMap(Map<String, dynamic> map) {
    try {
      var instance = RecipeSearchResult();
      Function.apply(instance.inject, [], symbolizeKeys(map));
      return instance;
    } on NoSuchMethodError catch (e) {
      print(e);
    }
    return null;
  }

  @override
  inject({String name, int id, int cookTime = 1}) {
    this.name = name;
    this.id = id;
    this.cookTime = cookTime;
  }
}

class MenuSearchResult extends TypeSearchResult {
  List<String> days;

  MenuSearchResult();

  factory MenuSearchResult.fromMap(Map<String, dynamic> map) {
    try {
      var instance = MenuSearchResult();
      Function.apply(instance.inject, [], symbolizeKeys(map));
      return instance;
    } on NoSuchMethodError catch (e) {
      print(e);
    }
    return null;
  }

  @override
  inject({String name, num id, List<dynamic> days}) {
    this.name = name;
    this.id = id;
    this.days = days.cast<String>();
  }
}

class MealSearchResult extends TypeSearchResult {
  num starters = 0;

  num courses = 0;

  num desserts = 0;

  MealSearchResult();

  factory MealSearchResult.fromMap(Map<String, dynamic> map) {
    try {
      var instance = MealSearchResult();
      Function.apply(instance.inject, [], symbolizeKeys(map));
      return instance;
    } on NoSuchMethodError catch (e) {
      print(e);
    }
    return null;
  }

  @override
  inject(
      {String name,
      num id,
      num starters = 0,
      num courses = 0,
      num desserts = 0}) {
    this.name = name;
    this.id = id;
    this.starters = starters;
    this.courses = courses;
    this.desserts = desserts;
  }
}
