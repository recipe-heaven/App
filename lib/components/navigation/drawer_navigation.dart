import 'package:App/routes/router.dart';
import 'package:App/routes/routes.dart';
import 'package:App/service/auth_service.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/menu_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

/// Makes sure we pop the drawer of the stack before we route to a page
void _onDrawerItemTap(BuildContext context, String route) {
  // Closes the drawer
  Navigator.pop(context);
  Navigator.pushNamed(context, route);
}

Drawer getDrawer(BuildContext context) {
  final _authServ = AuthService(HttpServiceClient());
  return Drawer(
      child: Container(
    decoration: BoxDecoration(color: elementBackgroundColor),
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: elementBackgroundColor,
          ),
          child: Column(
            children: [
              Text('Recipe heaven', style: logoTextStyle),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        createDrawerItem("Search", RouteSearch, Icons.search, context),
        // TODO MAKE CONDITIONAL
        createDrawerItem("Profile", RouteUserChangePass, Icons.person, context),

        if (true)
          // TODO REMOVE LATER :D
          ...[
          createDrawerItem("-----DEV BELOW HERE------", RouteUserChangePass,
              Icons.dangerous, context),
          createDrawerItem("New meal", RouteMealNew, Icons.adb, context),
          createDrawerItem("New recipe", RouteRecipeNew, Icons.adb, context),
          createDrawerItem("New menu", RouteMenuNew, Icons.adb, context),
          createDrawerItem("Login", RouteUserLogin, Icons.adb, context),
          createDrawerItem("Create user", RouteUserNew, Icons.adb, context),
          ListTile(
              leading: Icon(
                Icons.send,
                color: primaryTextColor,
              ),
              title: Text("DEBUG LOGIN"),
              onTap: () {
                _authServ.loginEmailPassword(
                    email: 'mail@mail.com', password: '123456789');
              }),
          ListTile(
              leading: Icon(
                Icons.send,
                color: primaryTextColor,
              ),
              title: Text("view menu 4"),
              onTap: () {
                Navigator.pushNamed(
                    context, pathWtihParameters(RouteMenuView, {"id": "4"}));
              }),
        ]
      ],
    ),
  ));
}

/// Creates the lsit title items for the
/// drawer.
ListTile createDrawerItem(
    String text, String route, IconData icon, BuildContext context) {
  return ListTile(
      leading: Icon(
        icon,
        color: primaryTextColor,
      ),
      title: Text(text),
      onTap: () {
        _onDrawerItemTap(context, route);
      });
}
