import 'package:flutter/cupertino.dart';

// our lord and saviour https://regex101.com/
final alpha = new RegExp(r'[A-Z]');
final hashtag = new RegExp(r'^(((^| )#([a-zA-Z]*))* *)*$');
final floatRegex = new RegExp(r'^(\d*(.|,)\d*)$');

String validateTagFeald(String value) {
  // test if a valid tag
  if (value.contains(hashtag) || value.length == 0) {
    return null;
  }

  // if not try to say why
  var split = value.split(" ");
  for (String tag in split) {
    if (!tag.startsWith("#")) {
      return "All tags have to start with #";
    }
  }
}

String validateFloatInput(String value) {
  if (value.contains(floatRegex)) {
    return null;
  }
  return "enter a number dipshit";
}

String validateAnyInputt(String value) {
  if (value.length > 1) {
    return null;
  } else {
    return "provide some input";
  }
}
/*

 shadowColor: Theme.of(context).shadowColor,
          elevation: 10,
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        )
 */
