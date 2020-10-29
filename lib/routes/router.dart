import 'package:App/pages/create_meal/create_meal.dart';
import 'package:App/pages/create_recipe/create_recipe.dart';
import 'package:App/pages/home/home.dart';
import 'package:App/pages/login/login.dart';
import 'package:App/pages/profile/change_password.dart';
import 'package:App/pages/register/register.dart';
import 'package:App/pages/view_meal/view_meal.dart';

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
      page = Home();
      break;
    case RouteUserNew:
      page = NewUserPage();
      break;
    case RouteUserLogin:
      page = LoginPage();
      break;
    case RouteUserProfile:
    case RouteUserEditProfile:
    case RouteUserChangePass:
      page = ChangePassPage();
      break;
    case RouteRecipeNew:
      page = NewCoursePage();
      break;
    //case RouteRecipeEdit:
    case RouteRecipeView:
    case RouteMealNew:
      page = CreateMealPage();
      break;
    case RouteMealEdit:
    case RouteMealView:
      page = CourseMealPage();
      break;
    case RouteMenuNew:
    case RouteMenuEdit:
    case RouteMenuView:
    case RouteMenuShoppingList:
      break;
    default:
      return null;
  }

  return MaterialPageRoute(builder: (context) => page);
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
