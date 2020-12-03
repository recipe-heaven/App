import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:App/routes/router.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:App/data_classes/recipe.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/store/store.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

import 'http_client.dart';

class RecipeService {
  static final HttpServiceClient _httpClient = HttpServiceClient();

  // static Future<Recipe> getExample(int recipeId) async {
  //   return Future<Recipe>.delayed(
  //       Duration(seconds: 3), () => TEST_DATA.recipes.first);
  // }

  static Future<CompleteRecipe> getFullRecipe(int recipeId) async {
    var response = _httpClient.auth().get(getFullRecipeEndpoint + "$recipeId");
    return response.then((value) => _handleGetFullRecipe(value));
  }

  static CompleteRecipe _handleGetFullRecipe(Response response) {
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      if (body["data"] != null) {
        return CompleteRecipe.fromJson(body["data"]);
      }
    }
    return null;
  }

  /// Tries to fetch multiple minified recipes from the server by their ids
  /// provided as list.
  Future<List<Recipe>> getMultipleMinifiedRecipes(List<int> recipeIds) async {
    try {
      if (recipeIds.length == 0) return List();
      String ids = "";
      recipeIds.forEach((id) {
        ids += "$id,";
      });
      ids = ids.replaceRange(ids.length - 1, null, "");
      var response = await _httpClient.auth().get(
          pathWtihParameters(getMultipleSimpleRecipeEndpoint, {"ids": ids}),
          headers: {
            'Content-type': "application/json",
          });
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["data"] != null) {
          List<Recipe> simpleRecipes = List();
          for (var simpleRecipe in body["data"]) {
            simpleRecipes.add(Recipe.fromJson(simpleRecipe));
          }
          return simpleRecipes;
        }
      } else {
        return List();
      }
    } on IOException catch (e) {
      print(e);
    }
    return List();
  }

  static Future<bool> newRecipe(Recipe recipe, File imageFile) async {
    var uri = Uri.parse(newRecipeEndpoint);
    final token = await Storage().getToken();
    print(json.encode(recipe.toJson()));
    var request = http.MultipartRequest("POST", uri)
      ..headers.addAll({"Authorization": token})
      ..fields["recipe"] = json.encode(recipe.toJson())
      ..files.add(await http.MultipartFile.fromPath("image", imageFile.path,
          contentType: MediaType.parse(lookupMimeType(imageFile.path))));
    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> editRecipe(Recipe recipe, File imageFile) async {
    var uri = Uri.parse(editRecipeEndpoint);

    final token = await Storage().getToken();

    var request = http.MultipartRequest("POST", uri)
      ..headers.addAll({"Authorization": token})
      ..fields["recipe"] = json.encode(recipe.toJson());
    if (imageFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
          "image", imageFile.path,
          contentType: MediaType.parse(lookupMimeType(imageFile.path))));
    }

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
