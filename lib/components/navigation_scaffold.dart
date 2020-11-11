import 'package:App/components/navigation/bottom_navigation.dart';
import 'package:App/components/navigation/drawer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Provides a scaffold with navigation bar and
/// drawer menu.
/// Use this as base scaffold where navigation is preffered.
class ScaffoldWithNavigation extends StatefulWidget {
  final Widget body;
  ScaffoldWithNavigation({Key key, this.body}) : super(key: key);

  @override
  _ScaffolWithNavigationState createState() => _ScaffolWithNavigationState();
}

class _ScaffolWithNavigationState extends State<ScaffoldWithNavigation> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: widget.body,
      bottomNavigationBar: navigationBar(context, (isNavigating) {
        try {
          var sc = _scaffoldKey.currentState;
          if (sc.hasEndDrawer && !isNavigating) {
            if (!sc.isEndDrawerOpen) {
              sc.openEndDrawer();
            }
          }
        } on Exception catch (e) {
          print(e);
        }
      }),
      endDrawer: getDrawer(context),
    );
  }
}
