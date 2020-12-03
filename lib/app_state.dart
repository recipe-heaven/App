import 'package:App/data_classes/user.dart';
import 'package:flutter/widgets.dart';

/// Central app state provider.
class AppState extends ChangeNotifier {
  User _user;

  AppState(this._user);

  /// Returns the user signed in or null if no user is signed in
  get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }
}
