import 'package:App/components/time_widget.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/pages/explore/sear_result_card.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

class RecipeSearchResultCard extends StatelessWidget {
  final Recipe recipe;

  final BuildContext context;

  final bool selected;

  RecipeSearchResultCard(this.recipe, this.context, {this.selected = false});

  @override
  Widget build(BuildContext context) {
    return SearchResultCard(children: [
      Row(
        children: [
          Icon(
            Icons.list,
            color: primaryTextColor,
            size: 14.0,
            semanticLabel: 'List icon',
          ),
          SizedBox(width: 4),
          Text("Recipe", style: Theme.of(context).accentTextTheme.headline4)
        ],
      ),
      Text(recipe.name, style: TextStyle(fontSize: 16)),
      TimeWidget(timeInSeconds: recipe.cookTime)
    ], background: recipe.getDisplayImage(), selected: selected);
  }
}
