import 'dart:io';

import 'package:App/components/loading_spinnder.dart';
import 'package:App/components/navigation_scaffold.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/pages/view_recipe/recipe_displayer.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/recipe_service.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ViewRecipePage extends StatelessWidget {
  final _recipeId;
  Future<Recipe> _recipeFuture;

  ViewRecipePage(this._recipeId) {
    _recipeFuture = RecipeService.getExample(_recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigation(
        body: FutureBuilder(
      future: _recipeFuture,
      builder: (context, AsyncSnapshot<Recipe> snapshot) {
        if (snapshot.hasData) {
          return DisplayRecipe(snapshot.data);
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ],
          );
        } else {
          return getCircularSpinner();
        }
      },
    ));
  }
}
