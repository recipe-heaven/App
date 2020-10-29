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

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'public': instance.public,
      'recipe': instance.recipe,
    };
