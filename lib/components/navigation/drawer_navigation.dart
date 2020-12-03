import 'package:App/app_state.dart';
import 'package:App/routes/router.dart';
import 'package:App/routes/routes.dart';
import 'package:App/routes/routes_options.dart';
import 'package:App/service/auth_service.dart';
import 'package:App/service/http_client.dart';
import 'package:App/service/user_service.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Makes sure we pop the drawer of the stack before we route to a page
void _onDrawerItemTap(BuildContext context, String route, {Object arguments}) {
  // Closes the drawer
  Navigator.pop(context);
  Navigator.pushNamed(context, route, arguments: arguments);
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
            image: DecorationImage(
                fit: BoxFit.fill,
                image: ExactAssetImage("assets/images/DRAWER-IMAGE.jpg")),
            color: elementBackgroundColor,
          ),
          child: Column(
            children: [
              Text('Recipe heaven', style: logoTextStyle),
              Text('All your favourite recipes.'),
            ],
          ),
        ),
        createDrawerItem("Search", () => _onDrawerItemTap(context, RouteSearch),
            Icons.search, context),
        createDrawerItem(
            "My items",
            () => _onDrawerItemTap(context, RouteSearch,
                arguments: SearchRouteOptions(searchOwnedOnly: true)),
            Icons.food_bank,
            context),
        createDrawerItem(
            "New menu",
            () => _onDrawerItemTap(context, RouteMenuNew),
            Icons.menu_book,
            context),
        createDrawerItem(
            "New meal",
            () => _onDrawerItemTap(context, RouteMealNew),
            Icons.restaurant,
            context),
        createDrawerItem(
            "New recipe",
            () => _onDrawerItemTap(context, RouteRecipeNew),
            Icons.list,
            context),
        createDrawerItem(
            "Profile",
            () => _onDrawerItemTap(context, RouteUserChangePass),
            Icons.person,
            context),
        createDrawerItem("Logout", () async {
          await UserService(HttpServiceClient()).logout();
          Provider.of<AppState>(context).user = null;
          Navigator.pop(context);
          // Remove all routes
          Navigator.pushNamedAndRemoveUntil(
              context, RouteUserLogin, (_) => false);
        }, Icons.logout, context),
        if (false)

          // TODO REMOVE LATER :D
          ...[
          createDrawerItem(
              "-----DEV BELOW HERE------",
              () => _onDrawerItemTap(context, RouteUserChangePass),
              Icons.dangerous,
              context),
          createDrawerItem(
              "New meal",
              () => _onDrawerItemTap(context, RouteMealNew),
              Icons.adb,
              context),
          createDrawerItem(
              "New recipe",
              () => _onDrawerItemTap(context, RouteRecipeNew),
              Icons.adb,
              context),
          createDrawerItem(
              "New menu",
              () => _onDrawerItemTap(context, RouteMenuNew),
              Icons.adb,
              context),
          createDrawerItem(
              "Login",
              () => _onDrawerItemTap(context, RouteUserLogin),
              Icons.adb,
              context),
          createDrawerItem(
              "Create user",
              () => _onDrawerItemTap(context, RouteUserNew),
              Icons.adb,
              context),
          ListTile(
              leading: Icon(
                Icons.send,
                color: primaryTextColor,
              ),
              title: Text("DEBUG LOGIN"),
              onTap: () {
                _authServ.loginEmailPassword(
                    email: 'christoffer.andersen@live.com',
                    password: '123456789');
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
    String text, VoidCallback ontap, IconData icon, BuildContext context) {
  return ListTile(
      leading: Icon(
        icon,
        color: primaryTextColor,
      ),
      title: Text(text),
      onTap: ontap);
}
