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

Map<String, dynamic> _$SearchOptionsToJson(SearchOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('searchString', instance.searchString);
  writeNotNull('ownedOnly', instance.ownedOnly);
  writeNotNull('includeMeals', instance.includeMeals);
  writeNotNull('includeMenus', instance.includeMenus);
  writeNotNull('includeRecipes', instance.includeRecipes);
  return val;
}
