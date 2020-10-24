import 'package:App/routes/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var route = "/home/test";
  test('first query parameters should start with ?name=', () {
    String path = pathWtihParameters(route, {"name": "any"});
    expect(path.split(route)[1].startsWith("?name="), true);
  });

  test('following parameters should start with &id=5', () {
    String path = pathWtihParameters(route, {"name": "any", "id": "5"});
    expect(path.endsWith("y&id=5"), true);
  });

  test('should return a Widget', () {
    MaterialPageRoute page =
        router(null, RouteSettings(arguments: "", name: "/"));
    assert(page.buildContent(null) is Widget, true);
  });

  test('should not return a Widget', () {
    MaterialPageRoute page =
        router(null, RouteSettings(arguments: "", name: "/_none_some_url"));
    assert(page == null, true);
  });
}
