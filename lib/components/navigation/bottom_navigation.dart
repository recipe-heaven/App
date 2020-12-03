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
        Navigator.pushNamed(context, RouteSearch);
      }
      if (i == 2) {
        navigateCallback(false);
      }
      if (i != 2) {
        navigateCallback(true);
        _currentIndex = i;
      }
    },
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Week menu"),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
      BottomNavigationBarItem(
          icon: Padding(
              padding: EdgeInsets.only(top: 10), child: Icon(Icons.menu)),
          label: "")
    ],
  );
}

BottomNavigationBar navigationBar(
    BuildContext context, Function(bool changePage) navigateCallback) {
  return _bottomNavigationBar(context, navigateCallback);
}
