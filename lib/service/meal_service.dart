import 'dart:convert';
import 'dart:io';

import 'package:App/data_classes/meal.dart';
import 'package:App/routes/router.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class MealService {
  static final HttpServiceClient _httpClient = HttpServiceClient();

  // static Future<Meal> getExample(int recipeId) async {
  //   return Future<Meal>.delayed(Duration(seconds: 3), () => TEST_DATA);
  // }

  static Future<CompleteMeal> getFullMeal(int mealId) async {
    var response = _httpClient.auth().get(getFullMealEndpoint + "$mealId");

    return response.then((value) => _handleGetFullMeal(value));
  }

  static CompleteMeal _handleGetFullMeal(Response response) {
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      if (body["data"] != null) {
        return CompleteMeal.fromJson(body["data"]);
      }
    }
    return null;
  }

  Future<bool> addNewMeal({@required NewMeal newMeal}) async {
    try {
      var response = await _httpClient.auth().post(newMealEndpoint,
          headers: {'Content-type': "application/json"},
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
      var response = await _httpClient.auth().pathch(updateMealEndpoint,
          headers: {'Content-type': "application/json"},
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
      if (mealIds.length == 0) return List();
      String ids = "";
      mealIds.forEach((id) {
        ids += "$id,";
      });
      ids = ids.replaceRange(ids.length - 1, null, "");
      var response = await _httpClient.auth().get(
          pathWtihParameters(getMultipleSimpleMealsEndpoint, {"ids": ids}),
          headers: {
            'Content-type': "application/json",
          });
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["data"] != null) {
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
