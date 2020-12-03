import 'package:App/app_state.dart';
import 'package:App/pages/create_meal/create_meal.dart';
import 'package:App/pages/create_menu/create_menu.dart';
import 'package:App/pages/create_recipe/create_recipe.dart';
import 'package:App/pages/explore/search.dart';
import 'package:App/pages/home/home.dart';
import 'package:App/pages/login/login.dart';
import 'package:App/pages/profile/change_password.dart';
import 'package:App/pages/register/register.dart';
import 'package:App/pages/view_meal/view_meal.dart';
import 'package:App/pages/view_menu/view_menu.dart';
import 'package:App/pages/view_recipe/view_recipe.dart';
import 'package:App/routes/routes_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  // Route protection
  var appState = Provider.of<AppState>(context);
  var requireLogin = appState.user == null;

  Widget page;

  if (requireLogin) {
    switch (path) {
      case RouteUserNew:
        page = NewUserPage();
        break;
      case RouteUserLogin:
        page = LoginPage();
        break;
      default:
        page = LoginPage();
        break;
    }
  } else {
    switch (path) {
      case RouteHome:
        page = Home();
        break;
      case RouteUserProfile:
      case RouteUserEditProfile:
      case RouteUserChangePass:
        page = ChangePassPage();
        break;

      // edit falls over
      case RouteRecipeEdit:
      case RouteRecipeNew:
        var mabyId = _tryGetId(queryParams);
        page = NewRecipePage(recipeId: mabyId);

        break;

      case RouteRecipeView:
        var mabyid = _tryGetId(queryParams);
        if (mabyid != null) {
          page = ViewRecipePage(mabyid);
        } else {
          // TODO: what shold we do when an invalid id is requested to view
          page = ViewRecipePage(0);
        }

        break;
      case RouteMealEdit:
      case RouteMealNew:
        page = CreateMealPage(meal: settings.arguments);
        break;
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
      case RouteMenuEdit:
        page = CreateMenuPage(menu: settings.arguments);
        break;
      case RouteMenuView:
        var mabyid = _tryGetId(queryParams);
        if (mabyid != null) {
          page = ViewMenuPage(mabyid);
        } else {
          // TODO: what shold we do when an invalid id is requested to view
          page = ViewMenuPage(4);
        }
        break;
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
  }

  return FadeRoute(page: page); //FadeRoute(page: page);
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

class ScaleRotateRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRotateRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: RotationTransition(
              turns: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
                ),
              ),
              child: child,
            ),
          ),
        );
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
