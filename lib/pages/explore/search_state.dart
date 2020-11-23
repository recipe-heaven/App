import 'package:App/data_classes/displayable.dart';
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
  bool _multiSelect = false;
  Map<String, Displayable> _selected = Map<String, Displayable>();

  String _searchString;

  SearchState(SearchRouteOptions options) {
    this._includeMenu = options.searchMenus;
    this._includeMeal = options.searchMeals;
    this._includeRecipe = options.searchRecipes;
    this._returnSelected = options.returnSelected;
    this._multiSelect = options.multiSelect;
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

  void addSelected(String type, Displayable selected) {
    var id = type + selected.id.toString();
    _selected[id] = selected;
    notifyListeners();
  }

  void removeSelected(String type, Displayable selected) {
    var id = type + selected.id.toString();
    _selected.remove(id);
    notifyListeners();
  }

  void clearAndAddSelected(String type, Displayable selected) {
    _selected.clear();
    this.addSelected(type, selected);
  }

  bool selectedContains(String type, Displayable selected) {
    var id = type + selected.id.toString();
    return this._selected.containsKey(id);
  }

  bool get includeMeal => _includeMeal;

  bool get includeRecipe => _includeRecipe;

  bool get includeMenu => _includeMenu;

  bool get ownedOnly => _ownedOnly;

  bool get returnSelected => _returnSelected;

  bool get selectMultiple => _multiSelect;

  String get searchString => _searchString;

  Map<String, Displayable> get selected => _selected;
}
