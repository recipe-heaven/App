import 'dart:convert';
import 'dart:io';

import 'package:App/data_classes/meal.dart';
import 'package:App/routes/router.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';
import 'package:App/store/store.dart';
import 'package:flutter/foundation.dart';

import '../main.dart';

class MealService {
  static final Http _httpClient = HttpServiceClient();

  static Future<Meal> getExample(int recipeId) async {
    return Future<Meal>.delayed(Duration(seconds: 3), () => TEST_DATA);
  }

  static Future<Meal> getFullMeal(int mealId) async {
    try {
      final token = await Storage().getToken();

      var response = await _httpClient.get(getFullMealEndpoint + "$mealId",
          headers: {
            'Content-type': "application/json",
            "Authorization": token
          });
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        if (body["data"] != null) {
          return CompleteMeal.fromJson(body["data"]);
        }
      } else {
        return null;
      }
    } on IOException catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> addNewMeal({@required NewMeal newMeal}) async {
    try {
      final token = await Storage().getToken();
      var response = await _httpClient.post(newMealEndpoint,
          headers: {'Content-type': "application/json", "Authorization": token},
          body: newMeal.toJsonString());

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on IOException {
      return false;
    }
  }

  Future<bool> updateMeal({@required NewMeal updatedMeal}) async {
    try {
      final token = await Storage().getToken();
      var response = await _httpClient.pathch(updateMealEndpoint,
          headers: {'Content-type': "application/json", "Authorization": token},
          body: updatedMeal.toJsonString());

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on IOException {
      return false;
    }
  }

  /// Tries to fetch multiple minified meals from the server by their ids
  /// provided as list.
  Future<List<SimpleMeal>> getMultipleMinifiedMeals(List<int> mealIds) async {
    try {
      final token = await Storage().getToken();
      String ids = "";
      mealIds.forEach((id) {
        ids += "$id,";
      });
      ids = ids.replaceRange(ids.length - 1, null, "");
      var response = await _httpClient.get(
          pathWtihParameters(getMultipleSimpleRecipeEndpoint, {"ids": ids}),
          headers: {
            'Content-type': "application/json",
            "Authorization": token
          });
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["data"] != null) {
          print(body);
          List<SimpleMeal> simpleMeals = List();
          for (var simpleMeal in body["data"]) {
            simpleMeals.add(SimpleMeal.fromJson(simpleMeal));
          }
          return simpleMeals;
        }
      } else {
        return null;
      }
    } on IOException catch (e) {
      print(e);
    }
    return null;
  }
}
