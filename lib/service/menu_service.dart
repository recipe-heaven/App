import 'dart:convert';
import 'dart:io';

import 'package:App/data_classes/menu.dart';
import 'package:App/main.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';
import 'package:App/store/store.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class MenuService {
  static final HttpServiceClient _httpClient = HttpServiceClient();

  /// Tries to add a new menu on the server for the loggedin user.
  /// Returns true if added, else false
  static Future<bool> addNewMenu({@required NewMenu newMenu}) async {
    try {
      final token = await Storage().getToken();
      var response = await _httpClient.post(newMenuEndpoint,
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

  /// Tries to update the provided menu with the server for the logged in user.
  /// Returns true if updated, else false.
  static Future<bool> updateMenu({@required NewMenu updatedMenu}) async {
    try {
      final token = await Storage().getToken();
      var response = await _httpClient.pathch(updateMenuEndpoint,
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

  /// Tries to get a menu by its id.
  /// Returns null if there is no menu found or there is an error.
  static Future<Menu> getMenu({@required int menuId}) async {
    var response =
        _httpClient.get(getSimpleMenuEndpoint + "$menuId", addAuth: true);

    return response.then((value) => _handleGetMenu(value));
  }

  static Menu _handleGetMenu(Response response) {
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      if (body["data"] != null) {
        return Menu.fromJson(body["data"]);
      }
    }
    return null;
  }
}
