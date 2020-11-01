import 'dart:math';

import 'package:App/routes/router.dart';
import 'package:App/store/store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var secretToken = "privatetoken";
  test('should store token', () async {
    expect(await Storage().saveToken(secretToken), true);
  });
  test('should get token', () async {
    expect(await Storage().getToken(), secretToken);
  });
}
