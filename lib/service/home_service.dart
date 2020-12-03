import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:App/data_classes/menu.dart';
import 'package:http/http.dart';
import 'package:App/service/endpoints.dart';

import 'http_client.dart';

class HomeService {
  static final HttpServiceClient _httpClient = HttpServiceClient();

  static Future<Menu> getUserActiveMenu() async {
    var response = _httpClient.auth().get(userGetCurrentMenuEndpoint);
    return response.then((value) => _handleGetActiveMenu(value));
  }

  static Menu _handleGetActiveMenu(Response response) {
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      if (body["data"] != null) {
        return Menu.fromJson(body["data"]);
      }
    }
    return null;
  }

  static Future<bool> setUserActiveMenu(int menuId) async {
    try {
      var response = await _httpClient
          .auth()
          .post(userChangeCurrentMenuEndpoint + "$menuId");
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on IOException catch (e) {
      print(e);
    }
    return false;
  }
}
