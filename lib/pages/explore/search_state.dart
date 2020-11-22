import 'package:App/data_classes/recipe.dart';
import 'package:App/routes/routes_options.dart';
import 'package:flutter/material.dart';

/// Contains state data for search related
/// data.
///
/// It extends ChangeNotifier and notifies listeners on change
class SearchState extends ChangeNotifier {
  bool _includeMeal = true;
  bool _includeRecipe = true;
  bool _includeMenu = true;
  bool _ownedOnly = false;
  bool _returnSelected = false;
  Map<String, UserOwned> _selected = Map<String, UserOwned>();

  String _searchString;

  SearchState(SearchRouteOptions options) {
    this._includeMenu = options.searchMenus;
    this._includeMeal = options.searchMeals;
    this._includeRecipe = options.searchRecipes;
    this._returnSelected = options.returnSelected;
    this._ownedOnly = options.searchOwnedOnly;
  }

  set includeMeal(bool include) {
    _includeMeal = include;
    notifyListeners();
  }

  set includeRecipe(bool include) {
    _includeRecipe = include;
    notifyListeners();
  }

  set includeMenu(bool include) {
    _includeMenu = include;
    notifyListeners();
  }

  set searchString(String searchString) {
    _searchString = searchString;
    notifyListeners();
  }

  void addSelected(String type, UserOwned selected) {
    var id = type + selected.id.toString();
    _selected[id] = selected;
    notifyListeners();
  }

  void removeSelected(String type, UserOwned selected) {
    var id = type + selected.id.toString();
    _selected.remove(id);
    notifyListeners();
  }

  bool selectedContains(String type, UserOwned selected) {
    var id = type + selected.id.toString();
    return this._selected.containsKey(id);
  }

  bool get includeMeal => _includeMeal;

  bool get includeRecipe => _includeRecipe;

  bool get includeMenu => _includeMenu;

  bool get ownedOnly => _ownedOnly;

  bool get returnSelected => _returnSelected;

  String get searchString => _searchString;

  Map<String, UserOwned> get selected => _selected;
}
