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

String validateLength(String value, {int min = -1, int max = -1}) {
  var invalid = false;
  if (min >= 0) {
    invalid = value.length < min;
  }
  if (max >= 0 && max >= min && !invalid) {
    invalid = value.length > max;
  }
  var errorMessage = "";
  if (min >= 0 && max >= 0 && max >= min) {
    errorMessage = "Must be between $min and $max characters";
  } else if (min >= 0) {
    errorMessage = "Must be minimum $min characters";
  } else if (max >= 0) {
    errorMessage = "Must be maximum $max characters";
  }

  return invalid ? errorMessage : null;
}

String validateEquality(String a, String b, String targetEquality) {
  print(a == b);
  if (a != b) {
    return "Is not equal to $targetEquality";
  }
  return null;
}
