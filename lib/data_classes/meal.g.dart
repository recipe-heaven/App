// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    name: json['name'] as String,
    id: json['id'] as int,
    owner: json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>),
    public: json['public'] as bool,
  )..recipes = (json['recipes'] as List)
      ?.map(
          (e) => e == null ? null : Recipe.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$MealToJson(Meal instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner', instance.owner?.toJson());
  writeNotNull('public', instance.public);
  writeNotNull('name', instance.name);
  writeNotNull('recipes', instance.recipes?.map((e) => e?.toJson())?.toList());
  return val;
}
