import 'package:App/components/info_card.dart';
import 'package:App/components/time_widget.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/data_classes/menu.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/routes/router.dart';
import 'package:App/routes/routes.dart';
import 'package:flutter/material.dart';

class DisplayMenu extends StatelessWidget {
  final Menu _menu;
  final editClickCallback;
  DisplayMenu(this._menu, {this.editClickCallback});

  Widget _makeDisplayCard(MenuItem menuItem, BuildContext context) {
    if (menuItem.item.runtimeType == Meal) {
      var menuMeal = menuItem.item as Meal;

      return InfoCard(
        title: menuMeal.name,
        background: menuMeal.displayImage,
        onPressed: () => Navigator.pushNamed(context,
            pathWtihParameters(RouteMealView, {"id": "${menuMeal.id}"})),
      );
    } else if (menuItem.item.runtimeType == Recipe) {
      var menuRecipe = menuItem.item as Recipe;
      return InfoCard(
        title: menuRecipe.name,
        background: menuRecipe.displayImage,
        children: [
          TimeWidget(
            timeInSeconds: menuRecipe.cookTime,
          )
        ],
        onPressed: () => Navigator.pushNamed(context,
            pathWtihParameters(RouteRecipeView, {"id": "${menuRecipe.id}"})),
      );
    } else {
      // todo: handle
      print("error in make display card menu displayer ");
    }
  }

  Widget _makeDayDisplay(int day, BuildContext context) {
    return Column(
      children: [
        Text(Menu.days[day]),
        for (MenuDay dayItem
            in _menu.getMenuItems().where((element) => element.day == day))
          _makeDisplayCard(dayItem, context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int day = 0; day < 7; day++) _makeDayDisplay(day, context)
      ],
    );
  }
}
