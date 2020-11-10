/// ADD ALL ROUTE OPTIONS CLASSES HERE

/// Provides search route options padded to the router
/// when routing to search.
class SearchRouteOptions {
  bool returnSelected;

  bool searchOwnedOnly;

  bool searchMeals;

  bool searchMenus;

  bool searchRecipes;

  bool onlyRecipes = false;

  bool onlyMeals = false;

  bool onlyMenus = false;

  SearchRouteOptions(
      {bool returnSelcted = false,
      bool searchOwnedOnly = false,
      bool searchMeals = true,
      bool searchMenus = true,
      bool searchRecipes = true,
      bool onlyRecipes = false,
      bool onlyMeals = false,
      bool onlyMenus = false}) {
    this.returnSelected = returnSelcted;
    this.searchOwnedOnly = searchOwnedOnly;
    this.searchMeals = searchMeals;
    this.searchMenus = searchMenus;
    this.searchRecipes = searchRecipes;

    if (onlyRecipes && (!onlyMeals && !onlyMenus)) {
      this.onlyRecipes = onlyRecipes;
    } else if (onlyMeals && (!onlyRecipes && !onlyMenus)) {
      this.onlyMeals = onlyMeals;
    } else if (onlyMenus && (!onlyRecipes && !onlyMeals)) {
      this.onlyMenus = onlyMenus;
    } else if ((onlyRecipes || onlyMeals || onlyMenus)) {
      throw ArgumentError("Can only have one ONLY selector");
    }
  }

  bool hasOnlySelector() {
    return (this.onlyMeals || this.onlyMenus || this.onlyRecipes);
  }
}
