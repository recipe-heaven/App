import 'package:flutter/cupertino.dart';

// our lord and saviour https://regex101.com/
final alpha = new RegExp(r'[A-Z]');
final hashtag = new RegExp(r'^(((^| )#([a-zA-Z0-9]+))+ *)*$');
final floatRegex = new RegExp(r'^(\d*(.|,)\d*)$');
final emailRegex =
    new RegExp(r'^[a-zA-Z0-9.-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9]{2,64})+$');

String validateTagFeald(String value) {
  // if valid tag or empty return valid
  if (value.contains(hashtag) || value.length == 0) {
    return null;
  }
  return "Tags must start with # and only contain alphanumeric characters";
}

String validateFloatInput(String value) {
  if (value.contains(floatRegex)) {
    return null;
  }
  return "Input is not a number";
}

String validateNotEmptyInput(String value) {
  if (value.trim().length > 1) {
    return null;
  } else {
    return "Can not be empty";
  }
}

String validateEmail(String value) {
  if (value.trim().contains(emailRegex)) {
    return null;
  } else {
    return "Please enter a valid email address";
  }
}
