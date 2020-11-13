// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    name: json['name'] as String,
    recipe: json['recipe'],
    owner: json['owner'],
    public: json['public'],
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('owner', instance.owner?.toJson());
  writeNotNull('public', instance.public);
  writeNotNull('name', instance.name);
  writeNotNull('recipe', instance.recipe?.map((e) => e?.toJson())?.toList());
  return val;
}
