import 'package:App/data_classes/recipe.dart';
import 'package:App/helpers/enumHelper.dart';
import 'package:App/pages/explore/sear_result_card.dart';
import 'package:App/pages/explore/result_item.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

Widget createMealSearchResultCard(
    MealSearchResult mealResult, BuildContext context, bool selected) {
  final widgets = [
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
    Text(mealResult.name, style: TextStyle(fontSize: 16)),
    ...getRecipeTypes(mealResult.recipeType, context)
  ];

  //TODO: LOAD BACKGROUND DYNAMICLY
  return createSearchResultCard(widgets,
      background: "assets/images/y_6cfb1008.jpg", selected: selected);
}

List<Widget> getRecipeTypes(List<String> types, BuildContext context) {
  int starters = 0;
  int main = 0;
  int dessert = 0;

  for (var type in types) {
    if (type == getStringFromEnum(MealType.starter)) {
      starters++;
    } else if (type == getStringFromEnum(MealType.main)) {
      main++;
    } else if (type == getStringFromEnum(MealType.dessert)) {
      dessert++;
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
