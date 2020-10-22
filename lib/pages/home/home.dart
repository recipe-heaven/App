import 'package:App/components/navigation/bottom_navigation.dart';
import 'package:App/components/navigation/drawer_navigation.dart';
import 'package:App/pages/home/labeled_card.dart';
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
            body: Container(
              child: ListView(
                children: [
                  ...[
                    generateLabeledCard(
                        accent: "monday",
                        subtitle: "kake",
                        title: "Bergensk fiskesuppe",
                        background: "assets/images/y_6cfb1008.jpg"),
                    generateLabeledCard(
                        accent: "monday",
                        subtitle: "kake",
                        title: "Bergensk fiskesuppe",
                        background: "assets/images/y_6cfb1008.jpg"),
                    generateLabeledCard(
                        accent: "monday",
                        subtitle: "kake",
                        title: "Bergensk fiskesuppe",
                        background: "assets/images/y_6cfb1008.jpg"),
                    generateLabeledCard(
                        accent: "monday",
                        subtitle: "kake",
                        title: "Bergensk fiskesuppe",
                        background: "assets/images/y_6cfb1008.jpg"),
                    generateLabeledCard(
                        accent: "monday",
                        subtitle: "kake",
                        title: "Bergensk fiskesuppe",
                        background: "assets/images/y_6cfb1008.jpg"),
                  ]
                ],
              ),
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
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

// Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image:
//                               ExactAssetImage("assets/images/y_6cfb1008.jpg"),
//                           fit: BoxFit.cover))

// var card =
