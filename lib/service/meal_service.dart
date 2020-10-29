import 'package:App/data_classes/meal.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';
import 'package:flutter/foundation.dart';

class MealService {
  final Http httpClient;

  MealService(this.httpClient);

  /// Tries to change the users password
  ///
  ///
  Future<bool> addNewMeal({@required Meal meal}) async {
    var response = await httpClient.post(newMealEndpoint, body: meal.toJson());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
