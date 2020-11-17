import 'package:App/pages/create_meal/create_meal.dart';
import 'package:App/pages/create_menu/create_menu.dart';
import 'package:App/pages/create_recipe/create_recipe.dart';
import 'package:App/pages/explore/search.dart';
import 'package:App/pages/home/home.dart';
import 'package:App/pages/login/login.dart';
import 'package:App/pages/profile/change_password.dart';
import 'package:App/pages/register/register.dart';
import 'package:App/pages/view_meal/view_meal.dart';
import 'package:App/pages/view_recipe/view_recipe.dart';
import 'package:App/routes/routes_options.dart';
import 'package:flutter/material.dart';
import "routes.dart";

int _tryGetId(Map<String, String> settings) {
  var mabyeId = settings["id"];

  if (mabyeId != null) {
    return int.tryParse(mabyeId);
  }
  return null;
}

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
      page = NewRecipePage();
      break;
    //case RouteRecipeEdit:
    case RouteRecipeView:
      var mabyid = _tryGetId(queryParams);
      if (mabyid != null) {
        page = ViewRecipePage(mabyid);
      } else {
        // TODO: what shold we do when an invalid id is requested to view
        page = ViewRecipePage(0);
      }

      break;
    case RouteMealNew:
      page = CreateMealPage();
      break;
    case RouteMealEdit:
    case RouteMealView:
      var mabyid = _tryGetId(queryParams);
      if (mabyid != null) {
        page = CourseMealPage(mabyid);
      } else {
        // TODO: what shold we do when an invalid id is requested to view
        page = CourseMealPage(0);
      }
      break;
    case RouteMenuNew:
      page = CreateMenuPage();
      break;
    case RouteMenuEdit:
      page = CreateMealPage();
      break;
    case RouteMenuView:
    case RouteMenuShoppingList:
      break;
    case RouteSearch:
      SearchRouteOptions options = SearchRouteOptions();
      if (settings.arguments.runtimeType == SearchRouteOptions) {
        options = settings.arguments;
      }
      page = Search(options);
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
