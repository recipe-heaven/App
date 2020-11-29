import 'package:App/routes/router.dart';
import 'package:App/routes/routes.dart' as route_names;
import 'package:App/app_state.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/user_service.dart';
import 'package:App/theme/themes.dart' as app_themes;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var _userService = UserService(HttpServiceClient());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var loggedinUser = await _userService.getCurrentUser();

  runApp(ChangeNotifierProvider(
    create: (context) => AppState(loggedinUser),
    child: App(),
  ));
}

class App extends StatefulWidget {
  _App createState() => _App();
}

class _App extends State<App> with WidgetsBindingObserver {
  AppState _appState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Event hook for when application state changes; close, active, resume...
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      _appState.user = await _userService.getCurrentUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<AppState>(context);
    return MaterialApp(
        title: 'Recipe Heaven',
        theme: app_themes.mainTheme.copyWith(),
        initialRoute: route_names.RouteHome,
        onGenerateRoute: (settings) => router(context, settings));
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
