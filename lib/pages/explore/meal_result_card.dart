import 'package:App/data_classes/meal.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/helpers/enumHelper.dart';
import 'package:App/pages/explore/sear_result_card.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

class MealSearchResultCard extends StatelessWidget {
  final Meal meal;

  final BuildContext context;

  final bool selected;

  MealSearchResultCard(this.meal, this.context, {this.selected = false});

  @override
  Widget build(BuildContext context) {
    return SearchResultCard(children: [
      Row(
        children: [
          Icon(
            Icons.restaurant,
            color: primaryTextColor,
            size: 14.0,
            semanticLabel: 'Recipe icon',
          ),
          SizedBox(width: 2),
          Text("Meal", style: Theme.of(context).accentTextTheme.headline4),
        ],
      ),
      Text(meal.name, style: TextStyle(fontSize: 16)),
      ...getRecipeTypes(meal.reicpeTypes, context)
    ], background: meal.displayImage, selected: selected);
  }
}

List<Widget> getRecipeTypes(List<MealType> types, BuildContext context) {
  int starters = 0;
  int main = 0;
  int dessert = 0;
  for (var type in types) {
    switch (type) {
      case MealType.starter:
        starters++;
        break;
      case MealType.main:
        main++;
        break;
      case MealType.dessert:
        dessert++;
        break;
      default:
    }
  }

  getText(int count, String text) =>
      Text("$count $text", style: Theme.of(context).accentTextTheme.headline4);

  List<Widget> typesList = List();

  if (starters > 0) typesList.add(getText(starters, "Starter(s)"));
  if (main > 0) typesList.add(getText(starters, "Main(s)"));
  if (dessert > 0) typesList.add(getText(dessert, "Dessert(s)"));
  return typesList;
}
