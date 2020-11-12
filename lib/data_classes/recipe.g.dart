// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    creator: json['creator'] == null
        ? null
        : User.fromJson(json['creator'] as Map<String, dynamic>),
    name: json['name'] as String,
    tags: json['tags'],
    type: json['type'],
    description: json['description'] as String,
    cookTime: json['cookTime'] as int,
    cookingSteps: _stepsFromJson(json['cookingSteps'] as String),
    recipeImage: json['recipeImage'] == null
        ? null
        : FoodImage.fromJson(json['recipeImage'] as Map<String, dynamic>),
  )
    ..visible = json['visible'] as bool
    ..recipeIngredients = (json['recipeIngredients'] as List)
        ?.map((e) =>
            e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..recommendedDrinks = _drinksFromJson(json['recommendedDrinks'] as String);
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('creator', instance.creator?.toJson());
  writeNotNull('name', instance.name);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('description', instance.description);
  writeNotNull('cookTime', instance.cookTime);
  writeNotNull('type', instance.type);
  writeNotNull('visible', instance.visible);
  writeNotNull('recipeIngredients',
      instance.recipeIngredients?.map((e) => e?.toJson())?.toList());
  writeNotNull('cookingSteps', _stepsToJson(instance.cookingSteps));
  writeNotNull('recommendedDrinks', _drinksToJson(instance.recommendedDrinks));
  writeNotNull('recipeImage', instance.recipeImage?.toJson());
  return val;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    json['tagName'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tagName', instance.tagName);
  return val;
}

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return Ingredient(
    name: json['name'] as String,
    amount: json['amount'] as num,
    comment: json['comment'] as String,
  );
}

Map<String, dynamic> _$IngredientToJson(Ingredient instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('amount', instance.amount);
  writeNotNull('comment', instance.comment);
  return val;
}
