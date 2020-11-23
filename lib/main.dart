import 'package:App/routes/router.dart';
import 'package:App/routes/routes.dart' as route_names;
import 'package:App/app_state.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/user_service.dart';

import 'package:App/app_state.dart';
import 'package:App/routes/router.dart';
import 'package:App/routes/routes.dart' as route_names;
import 'package:App/service/http_client.dart';
import 'package:App/service/user_service.dart';
import 'package:App/theme/themes.dart' as app_themes;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:App/theme/themes.dart' as app_themes;
import 'package:provider/provider.dart';
import 'data_classes/meal.dart';
import 'data_classes/menu.dart';
import 'data_classes/recipe.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppState(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _StateSetup(context);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: app_themes.mainTheme.copyWith(), //ThemeData.dark(),
        // for easy testing of pr
        initialRoute: route_names.RouteHome,
        onGenerateRoute: (settings) => router(context, settings));
  }
}

/// Provides facilities for setting application state and setup required when
/// the application starts.
class _StateSetup {
  BuildContext _context;

  AppState _appState;
  _StateSetup(this._context) {
    _appState = Provider.of<AppState>(_context, listen: false);
    _initState();
  }

  void _initState() {
    _setInitialUserState();
  }

  /// Will try to get user from stored token, and set the user state, by fetching
  /// the user from the server.
  void _setInitialUserState() async {
    var userService = UserService(HttpServiceClient());
    _appState.user = await userService.getCurrentUser();
  }
}

class Path404Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("ERROR SIDE NOT FOUND"
          "/side note burde kansje ha en vei ut av skjermen her"),
    );
  }
}
