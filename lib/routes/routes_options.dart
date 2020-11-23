/// ADD ALL ROUTE OPTIONS CLASSES HERE

/// Provides search route options padded to the router
/// when routing to search.
class SearchRouteOptions {
  String recipeType = "";

  /// When true, the selected item(s) are returen to the last screen
  bool returnSelected;

  /// Search only for items beloning to the currently logged in user only
  bool searchOwnedOnly;

  /// When true, meals are included in the search
  bool searchMeals;

  /// When true menus are included in the search
  bool searchMenus;

  /// When true recipes are included in the search
  bool searchRecipes;

  /// If true, and return selected is true, the user is able to select multiple
  /// items for return.
  bool multiSelect;

  SearchRouteOptions(
      {this.returnSelected = false,
      this.recipeType,
      this.searchOwnedOnly = false,
      this.searchMeals = true,
      this.searchMenus = true,
      this.searchRecipes = true,
      this.multiSelect = false});

  /// Returns true if we only have one type for the search, else false
  bool hasOnlyOneSearchSelector() {
    if (searchMenus && (!searchRecipes && !searchMeals)) return true;
    if (searchMeals && (!searchRecipes && !searchMenus)) return true;
    if (searchRecipes && (!searchMeals && !searchMenus)) return true;
    return false;
  }
}
