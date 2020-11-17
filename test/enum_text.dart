import 'package:App/data_classes/recipe.dart';
import 'package:App/helpers/enumHelper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Get correct enum type from string', () {
    var enumType = getEnumType(MealType.values, "main");
    expect(enumType, MealType.main);
  });
}
