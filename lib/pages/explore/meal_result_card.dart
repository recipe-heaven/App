import 'package:App/pages/explore/sear_result_card.dart';
import 'package:App/pages/explore/result_item.dart';
import 'package:App/pages/explore/search.dart';
import 'package:App/pages/explore/search_state.dart';
import 'package:App/routes/routes.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget createMealSearchResultCard(
    MealSearchResult mealResult, BuildContext context, bool selected) {
  final widgets = [
    Row(
      children: [
        Icon(
          Icons.restaurant,
          color: primaryTextColor,
          size: 14.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
        SizedBox(width: 2),
        Text("Meal", style: Theme.of(context).accentTextTheme.headline4),
      ],
    ),
    Text(mealResult.name, style: TextStyle(fontSize: 16)),
    Text("1 Starter", style: Theme.of(context).accentTextTheme.headline4),
    Text("1 Starter", style: Theme.of(context).accentTextTheme.headline4),
    Text("1 Starter", style: Theme.of(context).accentTextTheme.headline4),
  ];

  //TODO: LOAD BACKGROUND DYNAMICLY
  return createSearchResultCard(widgets,
      background: "assets/images/y_6cfb1008.jpg", selected: selected);
}
