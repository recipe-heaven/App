import 'dart:convert';
import 'dart:io';

import 'package:App/data_classes/user.dart';
import 'package:App/pages/register/new_user_form_data.dart';
import 'package:App/service/endpoints.dart';
import 'package:App/service/http_client.dart';
import 'package:App/store/store.dart';
import 'package:flutter/foundation.dart';

class LoginException implements Exception {
  String message;
  LoginException(this.message);
}

class CreateUserException implements Exception {
  String message;
  CreateUserException(this.message);
}

class AuthService {
  final Http httpClient;

  AuthService(this.httpClient);

  /// Tries to authenticate a user with the server.
  ///
  /// Throws HttpException if service or HTTP fails (network error)
  /// Throws LoginException when failing to login
  Future<User> loginEmailPassword(
      {@required String email, @required String password}) async {
    try {
      var response = await httpClient.post(loginEndpoint,
          headers: {"email": email.toLowerCase(), "password": password});
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        if (decodedJson["data"] != null) {
          var token = response.headers['authorization'];
          var user = User.fromJson(decodedJson["data"]);
          Storage().saveToken(token);
          return user;
        } else {
          throw LoginException("Wrong email/password");
        }
      } else {
        throw HttpException("Error logging in");
      }
    } on IOException {
      throw HttpException("Service unavailable");
    }
  }

  /// Tries to create a new user on the server.
  ///
  /// Throws HttpException if service or HTTP fails (network error)
  /// Throws CreateUserException when failing to create the user
  Future<void> createUser(NewUserFormData userDetails) async {
    try {
      var response = await httpClient.post(createUserEndpoint,
          headers: userDetails.toMap());
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        if (decodedJson["data"] == null) {
          throw CreateUserException("Email aldready exists");
        }
      } else {
        throw HttpException("Error creating user");
      }
    } on IOException {
      throw HttpException("Service unavailable");
    }
  }
}
