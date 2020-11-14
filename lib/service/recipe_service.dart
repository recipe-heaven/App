import 'dart:convert';
import 'dart:io';

import 'dart:async';
import 'dart:convert';

import 'package:http_parser/http_parser.dart';

import 'package:App/data_classes/recipe.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/store/store.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

import '../main.dart';
import 'http_client.dart';

class RecipeService {
  static final Http _httpClient = HttpServiceClient();

  static Future<Recipe> getExample(int recipeId) async {
    return Future<Recipe>.delayed(
        Duration(seconds: 3), () => TEST_DATA.recipe.first);
  }

  static Future<Recipe> getRecipe(int recipeId) async {
    try {
      var response = await _httpClient.get(getRecipeEndpoint + "?id=$recipeId");
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["data"] != null) {
          return Recipe.fromJson(body["data"]);
        }
      } else {
        return null;
      }
    } on IOException catch (e) {
      print(e);
    }
    return null;
  }

  static Future<bool> newRecipe(Recipe recipe, File imageFile) async {
    var uri = Uri.parse(newRecipeEndpoint);
    final token = await Storage().getToken();
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
}
