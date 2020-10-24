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
        Navigator.pushNamed(context, RouteRecipeNew);
      }
      if (i == 2) {
        Navigator.pushNamed(context, RouteMealView);
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
          icon: Icon(
            Icons.house,
          ),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.local_dining,
          ),
          label: "Menu"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag,
          ),
          label: "Shopping"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
          ),
          label: "hamburger")
    ],
    //backgroundColor: Colors.yellow,
  );
}

BottomNavigationBar navigationBar(
    BuildContext context, Function(bool changePage) navigateCallback) {
  return _bottomNavigationBar(context, navigateCallback);
}
