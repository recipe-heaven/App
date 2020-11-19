import 'dart:convert';
import 'dart:io';

import 'package:App/data_classes/menu.dart';
import 'package:App/main.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';
import 'package:App/store/store.dart';
import 'package:flutter/foundation.dart';

class MenuService {
  final Http _httpClient;

  MenuService(this._httpClient);

  Future<Menu> getExample(int recipeId) async {
    // return Future<Menu>.delayed(Duration(seconds: 3), () => TEST_MENU);
  }

  Future<bool> addNewMenu({@required NewMenu newMenu}) async {
    try {
      final token = await Storage().getToken();
      var response = await _httpClient.post(newMealEndpoint,
          headers: {'Content-type': "application/json", "Authorization": token},
          body: newMenu.toJsonString());

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on IOException {
      return false;
    }
  }

  Future<bool> updateMenu({@required NewMenu updatedMenu}) async {
    try {
      final token = await Storage().getToken();
      var response = await _httpClient.pathch(updateMealEndpoint,
          headers: {'Content-type': "application/json", "Authorization": token},
          body: updatedMenu.toJsonString());

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on IOException {
      return false;
    }
  }

  Future<Menu> getMenu({@required int menuId}) async {
    try {
      final token = await Storage().getToken();
      var response = await _httpClient.get(getSimpleMenuEndpoint + "$menuId",
          headers: {
            'Content-type': "application/json",
            "Authorization": token
          });

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["data"] != null) {
          return Menu.fromJson(body["data"]);
        }
        return null;
      } else {
        return null;
      }
    } on IOException {
      return null;
    }
  }
}
