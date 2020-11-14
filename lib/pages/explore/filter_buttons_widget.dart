import 'package:App/pages/explore/search_options.dart';
import 'package:App/pages/explore/search_state.dart';
import 'package:App/routes/routes_options.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FilterButtons extends StatefulWidget {
  final SearchRouteOptions options;
  FilterButtons(this.options, {Key key}) : super(key: key);

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButtons> {
  @override
  Widget build(BuildContext context) {
    List<Widget> filterButtons = List();

    if (!widget.options.hasOnlyOneSearchSelector()) {
      if (widget.options.searchMenus) {
        var filterButton =
            Consumer<SearchState>(builder: (context, state, child) {
          return createFilterButton(
              buttonText: "Menu",
              enabled: state.includeMenu,
              onPressed: () {
                state.includeMenu = !state.includeMenu;
              });
        });
        filterButtons.add(filterButton);
      }
      if (widget.options.searchMeals) {
        var mealButton =
            Consumer<SearchState>(builder: (context, state, child) {
          return createFilterButton(
              buttonText: "Meal",
              enabled: state.includeMeal,
              onPressed: () {
                state.includeMeal = !state.includeMeal;
              });
        });
        filterButtons.add(mealButton);
      }
      if (widget.options.searchRecipes) {
        var recipeButton =
            Consumer<SearchState>(builder: (context, state, child) {
          return createFilterButton(
              buttonText: "Recipe",
              enabled: state.includeRecipe,
              onPressed: () {
                state.includeRecipe = !state.includeRecipe;
              });
        });
        filterButtons.add(recipeButton);
      }
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: filterButtons);
  }

  FlatButton createFilterButton(
      {String buttonText, Function onPressed, bool enabled = true}) {
    return FlatButton(
      onPressed: onPressed,
      textColor: softTextColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: MediaQuery.of(context).size.width * .28,
        decoration: BoxDecoration(
            color: enabled ? buttonEnabledColor : buttonDisabledColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: const EdgeInsets.all(10.0),
        child: Text(
          buttonText,
          style: TextStyle(color: softTextColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
