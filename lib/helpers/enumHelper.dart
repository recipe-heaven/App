import 'package:App/data_classes/recipe.dart';

/// Returns the value of the enum type as string
String getStringFromEnum(enumType) {
  return describeEnum(enumtype);
}

/// Returns the enum type for the provided enum string representation
getEnumType(enumType, stringRepresentation) {
  return enumType.values
      .firstWhere((e) => getStringFromEnum(e) == stringRepresentation);
}
