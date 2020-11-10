import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

Card createSearchResultCard(List<Widget> w,
    {String background, bool selected = false}) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: elementBackgroundColor,
      child: Container(
          constraints: BoxConstraints.expand(height: 120),
          clipBehavior: Clip.antiAlias,
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border:
                  selected ? Border.all(width: 2.0, color: acceptColor) : null),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: w,
                ),
              ),
              Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(background), fit: BoxFit.cover)),
              )
            ],
          )));
}

Widget addTap(Widget widget, Function tap) {
  return GestureDetector(child: widget, onTap: tap);
}
