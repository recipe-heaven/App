import 'dart:convert';

import 'package:App/data_classes/user.dart';
import 'package:App/pages/register/new_user_form_data.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final Http httpClient;

  AuthService(this.httpClient);

  /// Tries to authenticate a user with the server.
  ///
  /// If authentication succeed the user is returned, else null.
  Future<User> loginEmailPassword(
      {@required String email, @required String password}) async {
    var response = await httpClient
        .post(loginEndpoint, headers: {"email": email, "password": password});
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      if (decodedJson["data"] != null) {
        var user = User.fromJson(decodedJson["data"]);
        return user;
      } else {
        return null;
      }
    } else {
      // ERROR
      return null;
    }
  }

  /// Tries to create a new user on the server.
  ///
  /// Returns true if creation was successfull, else false
  Future<bool> createUser(NewUserFormData userDetails) async {
    var response =
        await httpClient.post(createUserEndpoint, headers: userDetails.toMap());

    if (response.statusCode == 200) {
      return true;
    } else {
      // ERROR
      return false;
    }
  }
}
