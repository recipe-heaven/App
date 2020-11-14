import 'package:App/pages/explore/sear_result_card.dart';
import 'package:App/pages/explore/result_item.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

Card createMenuSearchResultCard(
    MenuSearchResult menuResult, BuildContext context, bool selected) {
  final widgets = [
    Row(
      children: [
        Icon(
          Icons.menu_book,
          color: primaryTextColor,
          size: 14.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
        SizedBox(width: 2),
        Text("Menu", style: Theme.of(context).accentTextTheme.headline4)
      ],
    ),
    Text(menuResult.name, style: TextStyle(fontSize: 16)),
    Row(children: getDays(menuResult.days, context))
  ];
  //TODO: LOAD BACKGROUND DYNAMICLY
  return createSearchResultCard(widgets,
      background: "assets/images/y_6cfb1008.jpg", selected: selected);
}

List<Widget> getDays(List<int> days, BuildContext context) {
  List<Widget> dayTextWidgets = List();
  String dayString = "";
  days.forEach((day) {
    if (day == 1) dayString = "Mon";
    if (day == 2) dayString = "Tue";
    if (day == 3) dayString = "Wed";
    if (day == 4) dayString = "Tue";
    if (day == 5) dayString = "Fri";
    if (day == 6) dayString = "Sat";
    if (day == 7) dayString = "Sun";
    dayTextWidgets.add(
        Text(dayString, style: Theme.of(context).accentTextTheme.headline4));
    dayTextWidgets.add(SizedBox(width: 5));
  });
  return dayTextWidgets;
}
