// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    name: json['name'] as String,
    recipes: (json['recipes'] as List)
        ?.map((e) =>
            e == null ? null : Recipe.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as int,
    owner: json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>),
    public: json['public'] as bool,
  );
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

CompleteMeal _$CompleteMealFromJson(Map<String, dynamic> json) {
  return CompleteMeal(
    name: json['name'] as String,
    recipes: (json['recipes'] as List)
        ?.map((e) => e == null
            ? null
            : CompleteRecipe.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as int,
    owner: json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>),
    public: json['public'] as bool,
  );
}

Map<String, dynamic> _$CompleteMealToJson(CompleteMeal instance) {
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

SimpleMeal _$SimpleMealFromJson(Map<String, dynamic> json) {
  return SimpleMeal(
    name: json['name'] as String,
    recipes: (json['recipes'] as List)
        ?.map((e) =>
            e == null ? null : Recipe.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as int,
    owner: json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>),
    public: json['public'] as bool,
  );
}

Map<String, dynamic> _$SimpleMealToJson(SimpleMeal instance) {
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

NewMeal _$NewMealFromJson(Map<String, dynamic> json) {
  return NewMeal(
    json['name'] as String,
    json['public'] as bool,
    (json['recipes'] as List)?.map((e) => e as int)?.toList(),
  )..id = json['id'] as int;
}

Map<String, dynamic> _$NewMealToJson(NewMeal instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('public', instance.public);
  writeNotNull('recipes', instance.recipes);
  writeNotNull('id', instance.id);
  return val;
}
