// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    recipe: json['recipe'],
  )
    ..name = json['name'] as String
    ..owner = json['owner'] as String
    ..public = json['public'] as bool;
}

Map<String, dynamic> _$MealToJson(Meal instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('owner', instance.owner);
  writeNotNull('public', instance.public);
  writeNotNull('recipe', instance.recipe?.map((e) => e?.toJson())?.toList());
  return val;
}
