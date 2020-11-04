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
    ingredients: json['ingredients'],
    cookingSteps: json['cookingSteps'],
    imageUrl: json['imageUrl'] as String,
  )
    ..public = json['public'] as bool
    ..recommendedDrinks =
        (json['recommendedDrinks'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'creator': instance.creator,
      'name': instance.name,
      'tags': instance.tags,
      'description': instance.description,
      'cookTime': instance.cookTime,
      'type': instance.type,
      'public': instance.public,
      'ingredients': instance.ingredients,
      'cookingSteps': instance.cookingSteps,
      'recommendedDrinks': instance.recommendedDrinks,
      'imageUrl': instance.imageUrl,
    };

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    json['tagName'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'tagName': instance.tagName,
    };

RecipeStep _$RecipeStepFromJson(Map<String, dynamic> json) {
  return RecipeStep(
    step: json['step'] as String,
  );
}

Map<String, dynamic> _$RecipeStepToJson(RecipeStep instance) =>
    <String, dynamic>{
      'step': instance.step,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return Ingredient(
    name: json['name'] as String,
    amount: json['amount'] as num,
    unitType: json['unitType'],
    comment: json['comment'] as String,
  );
}

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'unitType': _$IngredientUnitEnumMap[instance.unitType],
      'comment': instance.comment,
    };

const _$IngredientUnitEnumMap = {
  IngredientUnit.a: 'a',
  IngredientUnit.b: 'b',
  IngredientUnit.c: 'c',
  IngredientUnit.d: 'd',
};
