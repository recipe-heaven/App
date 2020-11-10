import 'package:App/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Container getCircularSpinner() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 10),
    child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(acceptColor)),
  );
}
