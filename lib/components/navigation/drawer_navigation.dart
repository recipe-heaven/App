import 'package:App/routes/routes.dart';
import 'package:flutter/material.dart';

void _onDrawerItemTap(BuildContext context, String route) {
  // Closes the drawer
  Navigator.pop(context);

  Navigator.pushNamed(context, route);
}

Drawer getDrawer(BuildContext context) {
  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text(
          'Drawer Header',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.message),
        title: Text('Messages'),
        onTap: () {
          _onDrawerItemTap(context, RouteUserNew);
        },
      ),
      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text('Profile'),
        onTap: () {
          _onDrawerItemTap(context, RouteUserNew);
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        onTap: () {
          _onDrawerItemTap(context, RouteUserLogin);
        },
      ),
    ],
  ));
}
