// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    name: json['name'] as String,
    description: json['description'] as String,
    cookTime: json['cookTime'] as int,
    image: json['image'] == null
        ? null
        : FoodImage.fromJson(json['image'] as Map<String, dynamic>),
    updated: json['updated'] as int,
    type: _mealTypeFromJson(json['type'] as String),
    id: json['id'] as int,
    owner: json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>),
    public: json['public'] as bool,
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) {
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
  writeNotNull('description', instance.description);
  writeNotNull('cookTime', instance.cookTime);
  writeNotNull('type', _mealTypeToJson(instance.type));
  writeNotNull('image', instance.image?.toJson());
  writeNotNull('updated', instance.updated);
  return val;
}

CompleteRecipe _$CompleteRecipeFromJson(Map<String, dynamic> json) {
  return CompleteRecipe(
    name: json['name'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
    cookTime: json['cookTime'] as int,
    type: _mealTypeFromJson(json['type'] as String),
    cookingSteps: _stepsFromJson(json['cookingSteps'] as String),
    recipeIngredients: (json['recipeIngredients'] as List)
        ?.map((e) =>
            e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recommendedDrinks: _drinksFromJson(json['recommendedDrinks'] as String),
    image: json['image'] == null
        ? null
        : FoodImage.fromJson(json['image'] as Map<String, dynamic>),
    id: json['id'] as int,
    owner: json['owner'] == null
        ? null
        : User.fromJson(json['owner'] as Map<String, dynamic>),
    public: json['public'] as bool,
  )..updated = json['updated'] as int;
}

Map<String, dynamic> _$CompleteRecipeToJson(CompleteRecipe instance) {
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
  writeNotNull('description', instance.description);
  writeNotNull('cookTime', instance.cookTime);
  writeNotNull('type', _mealTypeToJson(instance.type));
  writeNotNull('image', instance.image?.toJson());
  writeNotNull('updated', instance.updated);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  writeNotNull('recipeIngredients',
      instance.recipeIngredients?.map((e) => e?.toJson())?.toList());
  writeNotNull('cookingSteps', _stepsToJson(instance.cookingSteps));
  writeNotNull('recommendedDrinks', _drinksToJson(instance.recommendedDrinks));
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
