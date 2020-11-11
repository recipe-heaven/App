import 'package:App/routes/routes.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

/// Makes sure we pop the drawer of the stack before we route to a page
void _onDrawerItemTap(BuildContext context, String route) {
  // Closes the drawer
  Navigator.pop(context);
  Navigator.pushNamed(context, route);
}

Drawer getDrawer(BuildContext context) {
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
        // TODO REMOVE LATER :D
        createDrawerItem("-----DEV BELOW HERE------", RouteUserChangePass,
            Icons.dangerous, context),
        createDrawerItem("New meal", RouteMealNew, Icons.adb, context),
        createDrawerItem("New recipe", RouteRecipeNew, Icons.adb, context),
        createDrawerItem("New menu", RouteMenuNew, Icons.adb, context),
        createDrawerItem("Login", RouteMealNew, Icons.adb, context),
        createDrawerItem("Create user", RouteRecipeNew, Icons.adb, context),
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
