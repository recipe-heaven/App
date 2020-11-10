
import 'package:App/data_classes/menu.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';
import 'package:flutter/foundation.dart';

class MenuService {
  final Http httpClient;

  MenuService(this.httpClient);

  Future<bool> addNewMenu({@required Menu menu}) async {
    var response = await httpClient.post(newMenuEndpoint, body: menu.toJson());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
