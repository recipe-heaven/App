import 'dart:convert';

import 'package:App/data_classes/user.dart';
import 'package:App/pages/register/new_user_form_data.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';
import 'package:flutter/foundation.dart';

class UserService {
  final Http httpClient;

  UserService(this.httpClient);

  /// Tries to change the users password
  ///
  ///
  Future<bool> changePass(
      {@required String oldPass, @required String newPass}) async {
    var response = await httpClient.post(changePassEndpoint,
        headers: {"old-pass": oldPass, "new-pass": newPass});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
