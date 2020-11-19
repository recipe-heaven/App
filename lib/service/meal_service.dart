import 'dart:convert';
import 'dart:io';

import 'package:App/data_classes/meal.dart';
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
          return Meal.fromJson(body["data"]);
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
      var response = await _httpClient.pathch(editMealEndpoint,
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
}
