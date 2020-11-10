import 'package:App/pages/explore/sear_result_card.dart';
import 'package:App/pages/explore/result_item.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

Card createMenuSearchResultCard(MenuSearchResult menuResult, bool selected) {
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
        Text("Menu",
            style: TextStyle(
              fontSize: 12,
            )),
      ],
    ),
    Text(menuResult.name, style: TextStyle(fontSize: 16)),
    Row(
      children: [
        Text("Mon", style: TextStyle(fontSize: 12)),
        SizedBox(width: 5),
        Text("Tues", style: TextStyle(fontSize: 12)),
        SizedBox(width: 5),
        Text("Wed", style: TextStyle(fontSize: 12))
      ],
    )
  ];
  //TODO: LOAD BACKGROUND DYNAMICLY
  return createSearchResultCard(widgets,
      background: "assets/images/y_6cfb1008.jpg", selected: selected);
}
