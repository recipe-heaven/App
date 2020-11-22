import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback clickHandler;
  final String buttonText;

  RoundButton(this.clickHandler, {this.buttonText = "save"});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: clickHandler,
      elevation: 2.0,
      disabledColor: disabledAcceptColor,
      color: Theme.of(context).buttonColor,
      child: Text(
        buttonText.toUpperCase(),
        style: this.clickHandler != null
            ? Theme.of(context).accentTextTheme.headline3
            : Theme.of(context)
                .accentTextTheme
                .headline3
                .copyWith(color: Colors.grey),
      ),
      padding: EdgeInsets.all(25.0),
      shape: CircleBorder(),
    );
  }
}
