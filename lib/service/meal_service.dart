import 'dart:convert';
import 'dart:io';

import 'package:App/data_classes/meal.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';
import 'package:App/store/store.dart';
import 'package:flutter/foundation.dart';

class MealService {
  final Http httpClient;

  MealService(this.httpClient);

  Future<bool> addNewMeal({@required NewMeal newMeal}) async {
    try {
      final token = await Storage().getToken();
      var response = await httpClient.post(newMealEndpoint,
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
}
