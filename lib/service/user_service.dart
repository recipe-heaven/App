import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:App/data_classes/user.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';
import 'package:App/store/store.dart';
import 'package:flutter/foundation.dart';

class UserService {
  final Http httpClient;

  UserService(this.httpClient);

  /// Tries to change the password for the user
  ///
  Future<bool> changePass(
      {@required String oldPass, @required String newPass}) async {
    // TODO Chaange signature
    try {
      var response = await httpClient
          .post(changePassEndpoint, headers: {"password": newPass});
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

  /// Tries to get the current user from as stored token.
  ///
  /// User is returned if token not expired and is valid, else null is returned.
  Future<User> getCurrentUser() async {
    try {
      final token = await Storage().getToken();
      var response = await httpClient
          .get(currentUserEndpoint, headers: {"Authorization": token});
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        if (body["data"] != null) {
          return User.fromJson(body["data"]);
        }
      } else {
        return null;
      }
    } on IOException {
      return null;
    }
  }

  /// Logouts the current user by clearing the JWT
  Future<bool> logout() async {
    try {
      return await Storage().clearToken();
    } on Exception {
      return false;
    }
  }
}
