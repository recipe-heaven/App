import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Displayes a snack bar with : The "whatUpdated" was successfullu saved or updated if
/// updated parameter is set to true. If error is set to true, it will display and error
/// message.
/// Requires a context of Scaffold to be able to display the snackbar
void displaySavedSnackbar(String whatUpdated, BuildContext context,
    {bool updated = false, bool error = false}) {
  String feedbackText = "";
  if (!error) {
    feedbackText = "The $whatUpdated was successfully ";
    if (updated) {
      feedbackText += "updated!";
    } else {
      feedbackText += "created!";
    }
  } else {
    feedbackText = "Ooops, something went wrong!";
  }
  Scaffold.of(context).showSnackBar(
    SnackBar(content: Text(feedbackText)),
  );
}
