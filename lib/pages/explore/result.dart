import 'package:App/data_classes/meal.dart';
import 'package:App/data_classes/menu.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

List<dynamic> _resultItemToType(List<dynamic> results) {
  List<dynamic> convertedResults = List();

  try {
    for (var result in results) {
      switch (result["type"]) {
        case "recipe":
          convertedResults.add(Recipe.fromJson(result["data"]));
          break;
        case "meal":
          convertedResults.add(Meal.fromJson(result["data"]));
          break;
        case "menu":
          convertedResults.add(Menu.fromJson(result["data"]));
          break;
        default:
      }
    }
  } on Exception catch (e) {}

  return convertedResults;
}

@JsonSerializable()
class Result {
  @JsonKey(fromJson: _resultItemToType)
  List<dynamic> result = [];

  Result(this.result);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
