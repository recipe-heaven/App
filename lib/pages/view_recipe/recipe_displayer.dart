import 'package:App/data_classes/recipe.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DisplayRecipe extends StatelessWidget {
  final CompleteRecipe _recipe;
  final editClickCallback;
  DisplayRecipe(this._recipe, {this.editClickCallback});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                  begin: Alignment(0.0, 0.0),
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Colors.transparent
                  ]).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: _recipe.displayImage),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      _recipe.name,
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: editClickCallback)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: [
                    Icon(Icons.access_time,
                        color: Theme.of(context).iconTheme.color),
                    Text(
                      _recipe.cookTime.toString(),
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline3
                          .copyWith(fontSize: 15),
                    )
                  ],
                ),
                Row(
                  children: [
                    for (var tag in _recipe.tags) ...[
                      Text(
                        tag.tagName,
                        style: Theme.of(context).primaryTextTheme.headline4,
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ]
                  ],
                ),
                Text(
                  _recipe.description,
                  style: Theme.of(context).accentTextTheme.bodyText2,
                ),
                Divider(
                  color: Theme.of(context).dividerColor,
                  thickness: .5,
                ),
                Text("Ingredients",
                    style: Theme.of(context).textTheme.headline2),
                Column(
                  children: [
                    for (Ingredient ing in _recipe.recipeIngredients) ...[
                      Text(
                        "${ing.amount} ${describeEnum(ing.unitType)} ${ing.name} ${ing.comment}",
                        style: Theme.of(context).accentTextTheme.headline3,
                      )
                    ]
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ]),
        ),
        Column(
          children: [
            for (MapEntry<int, RecipeStep> entry
                in _recipe.cookingSteps.asMap().entries) ...[
              Container(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Text(
                            entry.value.step,
                            style: Theme.of(context).accentTextTheme.bodyText2,
                          ),
                        ),
                        color: recipeStepDescriptionBackground,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/step-flag.png",
                            width: 56,
                            height: 36,
                          ),
                          Text(
                            (entry.key + 1).toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ],
                        alignment: Alignment(-0.6, -.4),
                      ),
                      alignment: Alignment(-1, 0),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              ),
            ]
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ],
    );
  }
}
