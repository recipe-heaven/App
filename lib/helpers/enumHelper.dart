import 'package:App/data_classes/recipe.dart';
import 'package:flutter/foundation.dart';

/// Returns the value of the enum type as string
String getStringFromEnum(enumType) {
  return describeEnum(enumType);
}
