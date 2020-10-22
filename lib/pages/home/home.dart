import 'package:App/components/navigation/bottom_navigation.dart';
import 'package:App/components/navigation/drawer_navigation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Builder(
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                  )
                ],
              ),
            ),
          );
        },
      ),
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
