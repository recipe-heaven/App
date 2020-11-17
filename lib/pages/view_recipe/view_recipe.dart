import 'dart:io';

import 'package:App/components/default_builder.dart';
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
    _recipeFuture = RecipeService.getFullRecipe(_recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigation(
      body: defaultBuilder<Recipe>(
          _recipeFuture, (Recipe recipe) => DisplayRecipe(recipe)),
    );
  }
}
