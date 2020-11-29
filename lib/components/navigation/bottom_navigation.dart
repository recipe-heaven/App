import 'package:App/routes/router.dart';
import 'package:App/routes/routes.dart';
import 'package:flutter/material.dart';

var _currentIndex = 0;

_bottomNavigationBar(
    BuildContext context, Function(bool changePage) navigateCallback) {
  return BottomNavigationBar(
    currentIndex: _currentIndex,
    type: BottomNavigationBarType.fixed,
    onTap: (i) {
      if (i == 0) {
        Navigator.pushNamed(context, RouteHome);
      }
      if (i == 1) {
        Navigator.pushNamed(context, RouteMenuNew);
      }
      if (i == 2) {
        Navigator.pushNamed(context, RouteMealNew);
      }
      if (i == 3) {
        navigateCallback(false);
      }
      if (i != 3) {
        navigateCallback(true);
        _currentIndex = i;
      }
    },
    items: [
      BottomNavigationBarItem(
          icon: Padding(
              padding: EdgeInsets.only(top: 10), child: Icon(Icons.home)),
          label: "Week menu"),
      BottomNavigationBarItem(
          icon: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(Icons.local_dining)),
          label: "New menu"),
      BottomNavigationBarItem(
          icon: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(Icons.shopping_bag)),
          label: "New meal"),
      BottomNavigationBarItem(
          icon: Padding(
              padding: EdgeInsets.only(top: 10), child: Icon(Icons.menu)),
          label: "")
    ],
    //backgroundColor: Colors.yellow,
  );
}

BottomNavigationBar navigationBar(
    BuildContext context, Function(bool changePage) navigateCallback) {
  return _bottomNavigationBar(context, navigateCallback);
}
