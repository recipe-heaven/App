import 'package:flutter/material.dart';

Card generateLabeledCard(
    {String accent, String title, String subtitle, String background}) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.transparent,
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
          constraints: BoxConstraints.expand(height: 175),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: ExactAssetImage(background), fit: BoxFit.cover)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(accent, style: TextStyle(fontSize: 16)),
              Text(title, style: TextStyle(fontSize: 24)),
              Text(subtitle),
            ],
          )));
}
