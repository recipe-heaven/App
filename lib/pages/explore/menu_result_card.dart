import 'package:App/data_classes/menu.dart';
import 'package:App/pages/explore/sear_result_card.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

class MenuSearchResultCard extends StatelessWidget {
  final Menu menu;

  final BuildContext context;

  final bool selected;

  MenuSearchResultCard(this.menu, this.context, {this.selected = false});

  @override
  Widget build(BuildContext context) {
    return SearchResultCard(children: [
      Row(
        children: [
          Icon(
            Icons.menu_book,
            color: primaryTextColor,
            size: 14.0,
            semanticLabel: 'Menu icon',
          ),
          SizedBox(width: 2),
          Text("Menu", style: Theme.of(context).accentTextTheme.headline4)
        ],
      ),
      Text(menu.name, style: TextStyle(fontSize: 16)),
      Row(children: getDays(menu.daysInMenu, context))
    ], background: menu.displayImage, selected: selected);
  }
}

List<Widget> getDays(List<int> days, BuildContext context) {
  List<Widget> dayTextWidgets = List();
  String dayString = "";
  days.forEach((day) {
    if (day == 0) dayString = "Mon";
    if (day == 1) dayString = "Tue";
    if (day == 2) dayString = "Wed";
    if (day == 3) dayString = "Tue";
    if (day == 4) dayString = "Fri";
    if (day == 5) dayString = "Sat";
    if (day == 6) dayString = "Sun";
    dayTextWidgets.add(
        Text(dayString, style: Theme.of(context).accentTextTheme.headline4));
    dayTextWidgets.add(SizedBox(width: 5));
  });
  return dayTextWidgets;
}
