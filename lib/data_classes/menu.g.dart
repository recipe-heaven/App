// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu(
    name: json['name'] as String,
    meals: (json['meals'] as List)
        ?.map((e) =>
            e == null ? null : MenuMeal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recipes: (json['recipes'] as List)
        ?.map((e) =>
            e == null ? null : MenuRecipe.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as int,
    owner: json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>),
    public: json['public'] as bool,
  );
}

Map<String, dynamic> _$MenuToJson(Menu instance) {
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
  writeNotNull('meals', instance.meals?.map((e) => e?.toJson())?.toList());
  writeNotNull('recipes', instance.recipes?.map((e) => e?.toJson())?.toList());
  return val;
}

MenuDay _$MenuDayFromJson(Map<String, dynamic> json) {
  return MenuDay()..day = json['day'] as int;
}

Map<String, dynamic> _$MenuDayToJson(MenuDay instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('day', instance.day);
  return val;
}

MenuMeal _$MenuMealFromJson(Map<String, dynamic> json) {
  return MenuMeal(
    json['meal'] == null
        ? null
        : SimpleMeal.fromJson(json['meal'] as Map<String, dynamic>),
    json['day'] as int,
  );
}

Map<String, dynamic> _$MenuMealToJson(MenuMeal instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('day', instance.day);
  writeNotNull('meal', instance.meal?.toJson());
  return val;
}

MenuRecipe _$MenuRecipeFromJson(Map<String, dynamic> json) {
  return MenuRecipe(
    json['recipe'] == null
        ? null
        : Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
    json['day'] as int,
  );
}

Map<String, dynamic> _$MenuRecipeToJson(MenuRecipe instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('day', instance.day);
  writeNotNull('recipe', instance.recipe?.toJson());
  return val;
}

NewMenu _$NewMenuFromJson(Map<String, dynamic> json) {
  return NewMenu(
    json['name'] as String,
    json['public'] as bool,
    (json['recipes'] as List)
        ?.map((e) =>
            e == null ? null : MenuRecipe.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['meals'] as List)
        ?.map((e) =>
            e == null ? null : MenuMeal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..id = json['id'] as int;
}

Map<String, dynamic> _$NewMenuToJson(NewMenu instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('public', instance.public);
  writeNotNull('recipes', instance.recipes?.map((e) => e?.toJson())?.toList());
  writeNotNull('meals', instance.meals?.map((e) => e?.toJson())?.toList());
  writeNotNull('id', instance.id);
  return val;
}
