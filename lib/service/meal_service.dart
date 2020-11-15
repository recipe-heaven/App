import 'package:App/data_classes/meal.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';
import 'package:flutter/foundation.dart';

import '../main.dart';

class MealService {
  static final Http httpClient = HttpServiceClient();

  static Future<Meal> getExample(int recipeId) async {
    return Future<Meal>.delayed(Duration(seconds: 3), () => TEST_DATA);
  }

  static Future<bool> addNewMeal({@required Meal meal}) async {
    var response = await httpClient.post(newMealEndpoint, body: meal.toJson());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
