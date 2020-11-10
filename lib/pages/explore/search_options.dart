import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'search_options.g.dart';

@JsonSerializable()
class SearchOptions {
  String searchString;

  bool ownedOnly;

  bool includeMeals;

  bool includeMenus;

  bool includeRecipes;

  SearchOptions(this.searchString, this.ownedOnly, this.includeMeals,
      this.includeMenus, this.includeRecipes);

  String toJsonString() => jsonEncode(_$SearchOptionsToJson(this));
}
