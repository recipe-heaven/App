import 'package:App/helpers/time.dart';
import 'package:App/pages/explore/result_item.dart';
import 'package:App/pages/explore/sear_result_card.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

Card createRecipeSearchResultCard(
    RecipeSearchResult recipeResult, bool selected) {
  final widgets = [
    Row(
      children: [
        Icon(
          Icons.list,
          color: primaryTextColor,
          size: 14.0,
          semanticLabel: 'List icon',
        ),
        SizedBox(width: 2),
        Text("Recipe",
            style: TextStyle(
              fontSize: 12,
            )),
      ],
    ),
    Text(recipeResult.name, style: TextStyle(fontSize: 16)),
    Row(
      children: [
        Icon(
          Icons.timer,
          color: primaryTextColor,
          size: 16.0,
          semanticLabel: 'Clock icon',
        ),
        SizedBox(width: 2),
        Text(getHourSecndsStringFromSeconds(recipeResult.cookTime),
            style: TextStyle(fontSize: 12)),
      ],
    ),
  ];
  //TODO: LOAD BACKGROUND DYNAMICLY
  return createSearchResultCard(widgets,
      background: "assets/images/y_6cfb1008.jpg", selected: selected);
}
