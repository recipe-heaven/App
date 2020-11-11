import 'package:App/components/navigation_scaffold.dart';
import 'package:App/pages/home/labeled_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigation(
        body: Container(
            child: ListView(
              children: [
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
              ],
            ),
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0)));
  }
}
