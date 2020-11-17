import 'package:App/routes/routes_options.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('search route has only selector', () {
    var p = SearchRouteOptions(searchMenus: false, searchRecipes: false);
    expect(p.hasOnlyOneSearchSelector(), true);
  });
}
