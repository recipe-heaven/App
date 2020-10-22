import 'package:App/main.dart';
import 'package:App/pages/user_pages.dart';
import 'package:flutter/material.dart';

import "routes.dart";

/// Performs routing logic and returns route pages for given path
Route<dynamic> router(BuildContext context, RouteSettings settings) {
  var uri = Uri.parse(settings.name);
  var queryParams = uri.queryParameters;
  var path = uri.path;

  Widget page;
  switch (path) {
    case RouteHome:
      page = MyHomePage();
      break;
    case RouteUserNew:
      page = NewUserPage();
      break;
    case RouteUserLogin:
      page = LoginPage();
      break;
    case RouteUserProfile:
    case RouteUserEditProfile:
    case RouteRecipeNew:
    case RouteRecipeEdit:
    case RouteRecipeView:
    case RouteMealNew:
    case RouteMealEdit:
    case RouteMealView:
    case RouteMenuNew:
    case RouteMenuEdit:
    case RouteMenuView:
    case RouteMenuShoppingList:
      break;
    default:
      return null;
  }

  return MaterialPageRoute(builder: (cotext) => page);
}

/// Generatesa route ling with query parameters ?key=value
String pathWtihParameters(String route, Map<String, String> params) {
  var queryParams = "";
  params.forEach((key, value) {
    if (queryParams.isEmpty) {
      queryParams += "?$key=$value";
    } else {
      queryParams += "&$key=$value";
    }
  });
  return "$route$queryParams";
}
