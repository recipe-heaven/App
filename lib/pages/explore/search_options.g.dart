// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchOptions _$SearchOptionsFromJson(Map<String, dynamic> json) {
  return SearchOptions(
    json['searchString'] as String,
    json['ownedOnly'] as bool,
    json['includeMeals'] as bool,
    json['includeMenus'] as bool,
    json['includeRecipes'] as bool,
  );
}

Map<String, dynamic> _$SearchOptionsToJson(SearchOptions instance) =>
    <String, dynamic>{
      'searchString': instance.searchString,
      'ownedOnly': instance.ownedOnly,
      'includeMeals': instance.includeMeals,
      'includeMenus': instance.includeMenus,
      'includeRecipes': instance.includeRecipes,
    };
