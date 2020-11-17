import 'package:App/data_classes/recipe.dart';

/// Returns the value of the enum type as string
String getStringFromEnum(enumType) {
  return enumType.toString().split('.')[1];
}

/// Returns the enum type for the provided enum string representation
getEnumType<T>(List<T> types, stringRepresentation) {
  return types.firstWhere((e) => getStringFromEnum(e) == stringRepresentation);
}
