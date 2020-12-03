import 'package:App/app_state.dart';
import 'package:App/components/info_card.dart';
import 'package:App/components/time_widget.dart';
import 'package:App/data_classes/meal.dart';
import 'package:App/data_classes/menu.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/data_classes/user.dart';
import 'package:App/routes/router.dart';
import 'package:App/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayMenu extends StatelessWidget {
  final Menu _menu;
  final editClickCallback;
  bool allowEdit = false;
  DisplayMenu(this._menu, {this.editClickCallback, this.allowEdit = false});

  Widget _mabyEditButton(BuildContext context) {
    User user = Provider.of<AppState>(context).user;
    if (user != null && allowEdit) {
      if (user.id == _menu.owner.id) {
        return IconButton(
            icon: Icon(
              Icons.edit,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: editClickCallback);
      }
    }
    return Container();
  }

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
    List<MenuItem> menuItems =
        _menu.getMenuItems().where((element) => element.day == day).toList();
    List<Widget> dayItemWidgets = List();
    if (menuItems.isNotEmpty) {
      dayItemWidgets.add(Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child:
            Text(Menu.days[day], style: Theme.of(context).textTheme.headline2),
      ));

      for (MenuDay dayItem in menuItems) {
        dayItemWidgets.add(_makeDisplayCard(dayItem, context));
      }

      dayItemWidgets.add(Divider(
        color: Theme.of(context).dividerColor,
        thickness: .5,
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [...dayItemWidgets],
    );
  }

  @override
  Widget build(BuildContext context) {
    // _menu.getMenuItems().forEach((element) {
    //   print("${element.item.name} ${element.day}");
    // });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment(1, 1),
          child: _mabyEditButton(context),
        ),
        for (int day = 0; day < 7; day++) _makeDayDisplay(day, context)
      ],
    );
  }
}
