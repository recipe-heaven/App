/// ADD ALL ROUTE OPTIONS CLASSES HERE

/// Provides search route options padded to the router
/// when routing to search.
class SearchRouteOptions {
  bool returnSelected;

  bool searchOwnedOnly;

  bool searchMeals;

  bool searchMenus;

  bool searchRecipes;

  SearchRouteOptions(
      {this.returnSelected = false,
      this.searchOwnedOnly = false,
      this.searchMeals = true,
      this.searchMenus = true,
      this.searchRecipes = true});

  /// Returns true if we only have one type for the search, else false
  bool hasOnlyOneSearchSelector() {
    if (searchMenus && !(searchRecipes && searchMeals)) return true;
    if (searchMeals && !(searchRecipes && searchMenus)) return true;
    if (searchRecipes && !(searchMeals && searchMenus)) return true;
    return false;
  }
}
