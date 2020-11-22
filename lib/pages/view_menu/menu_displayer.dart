import 'package:App/components/info_card.dart';
import 'package:App/components/loading_spinnder.dart';
import 'package:App/components/time_widget.dart';
import 'package:App/data_classes/menu.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/main.dart';
import 'package:App/routes/router.dart';
import 'package:App/routes/routes.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DisplayMenu extends StatelessWidget {
  final Menu _menu;
  final editClickCallback;
  DisplayMenu(this._menu, {VoidCallback this.editClickCallback});

  Widget _makeDisplayCard(MenuDay menuDay, BuildContext context) {
    if (menuDay.runtimeType == MenuMeal) {
      var menuMeal = menuDay as MenuMeal;

      return InfoCard(
        title: menuMeal.meal.name,
        background: menuMeal.meal.getDisplayImage(),
        onPressed: () => Navigator.pushNamed(context,
            pathWtihParameters(RouteMealView, {"id": "${menuMeal.meal.id}"})),
      );
    } else if (menuDay.runtimeType == MenuRecipe) {
      var menuRecipe = menuDay as MenuRecipe;
      return InfoCard(
        title: menuRecipe.recipe.name,
        background: menuRecipe.recipe.getDisplayImage(),
        children: [
          TimeWidget(
            timeInSeconds: menuRecipe.recipe.cookTime,
          )
        ],
        onPressed: () => Navigator.pushNamed(
            context,
            pathWtihParameters(
                RouteRecipeView, {"id": "${menuRecipe.recipe.id}"})),
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
