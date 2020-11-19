import 'package:App/helpers/time.dart';
import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Displays a clock with the time in hours and seconds from provided time in seconds
class TimeWidget extends StatelessWidget {
  const TimeWidget({Key key, this.timeInSeconds}) : super(key: key);

  final int timeInSeconds;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: primaryTextColor,
          size: 16.0,
          semanticLabel: 'Clock icon',
        ),
        SizedBox(width: 2),
        Text(getHourSecndsStringFromSeconds(timeInSeconds),
            style: Theme.of(context).accentTextTheme.headline4),
      ],
    );
  }
}
